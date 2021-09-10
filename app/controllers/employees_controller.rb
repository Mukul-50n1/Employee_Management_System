class EmployeesController < ApplicationController
  before_action :authenticate_employer!
  before_action :require_employee ,only: [:edit ,:adda ,:update]

  def index
    @employees = current_employer.employees.search_employee(params[:search] , params[:designate])
    @employees = @employees.page(params[:page])
  end

  def show  
  end

  def new   
    @employee = Employee.new
    2.times { @employee.addresses.new }
  end

  def create
    @employee = current_employer.employees.new(param_employee)
    if @employee.save   
      redirect_to '/employees'
    else 
      render 'new'
    end
  end


  def edit
  end

  def update    
    if @employee.update(param_employee_update)   
      flash[:notice] = "#{@employee.first_name} is updated" 
      redirect_to '/'
    else 
      render 'edit'
    end 
  end

  def destroy
    @identity = @employee.id
    @employee.destroy
    @employees = current_employer.employees
    #redirect_to '/employees'
    respond_to do |format|
      format.js 
    end
  end

  def adda
    @addrs  = @employee.addresses
  end

  def grouping
    @group = current_employer.employees.group("designation_id")
  end

  def employees_destroy
    @employee_ids = params[:index_array]
    @id_size = params[:index_array].size
    @employee = Employee.where(id: @employee_ids)
    @employee.destroy_all
    @employees = current_employer.employees
    respond_to :js
  end

  private

  def param_employee    
    permanent_address
    params.require(:employee).permit(:first_name, :last_name , :email, :dob ,:mobile,
     :doj,:designation_id ,:image,addresses_attributes: [:address_types , :country, :state , :city , :street_address,:_destroy , :chek] )
  end
  
  def param_employee_update
    params.require(:employee).permit(:first_name,:last_name,:mobile,:email,:dob,:doj)
  end

  def require_employee  
    @employee = current_employer.employees.find(params[:id])
  end

end



