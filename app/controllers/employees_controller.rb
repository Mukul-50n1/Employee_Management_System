  class EmployeesController < ApplicationController
    before_action :authenticate_employer!
    before_action :employer_check ,only: [:edit ,:destroy,:adda]


  def search
    @search = current_employer.employees.where("first_name LIKE :q OR last_name LIKE :q OR email LIKE :q " ,q: "%#{params[:search]}%")
    if @search.empty?
      flash[:notice] =  "result for '#{params[:search]}' is not found"
      redirect_to '/employees'
    end #rescue redirect_to "/employees"
    #respond_to :js
  end

  def index
    @employees = current_employer.employees
  end

  def show
    #@employee = current_employer.employees
  end

  def new
    @employee = Employee.new
    #@employee.addresses.build
    2.times { @employee.addresses.new }
    @first = "Current"
  end

  def create
    @employee = current_employer.employees.create(param_employee)
    if @employee.save   
      flash[:notice] = "#{@employee.first_name} is created"
      redirect_to '/employees'
    else 
      render 'new'
    end
  end

  # def edit
  #   i = current_employer.employees.ids
  #   a = (params[:id]).to_i
  #   if i.include?a
  #     @employee = Employee.find(params[:id])
  #   else
  #     #flash[:notice] => "You can't access other employees detail"
  #     redirect_to '/employees'
  #   end
  # end
  def edit
  end

  def update

    if @employee = current_employer.employees.find(params[:id])
       @employee.update(param_employee)   
       flash[:notice] = "#{@employee.first_name} is updated" 
       redirect_to '/'
    else 
       render 'edit'
    end rescue puts "error"
  end

  def destroy
    @employee.destroy
    redirect_to '/employees'
  end

  def adda
    @addrs  = @employee.addresses
  end

  private

  def param_employee
    
    if params[:employee][:addresses_attributes][:'0'][:"chek"] == "1"
        params[:employee][:addresses_attributes][:'1'][:country] = params[:employee][:addresses_attributes][:'0'][:country]
        params[:employee][:addresses_attributes][:'1'][:city] = params[:employee][:addresses_attributes][:'0'][:city]
        params[:employee][:addresses_attributes][:'1'][:street_address] = params[:employee][:addresses_attributes][:'0'][:street_address]
        #params[:employee][:addresses_attributes][:'1'] = params[:employee][:addresses_attributes][:'0']
    end
    
    params.require(:employee).permit(:first_name, :last_name , :email, :dob ,:mobile,
     :doj, addresses_attributes: [:address_types , :country, :state , :city , :street_address,:chek] )
    
  end
  
  def employer_check
    @employee = Employee.find(params[:id])
  end

end