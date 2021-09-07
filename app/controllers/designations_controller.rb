class DesignationsController < ApplicationController
  before_action :authenticate_employer!
  def index 
    @designations =  Designation.all
  end

  def new
    @designation = Designation.new
  end

  def create
    @designation = Designation.create(param_designation)
    if @designation.save
      redirect_to '/designations'
	  else
	    render 'new'
	  end
  end
  
  def edit
  	@designation = Designation.find(params[:id])
  end

  def update
  	@designation = Designation.find(params[:id])
  	@designation = @designation.update(param_designation)
  	redirect_to '/designations'
  end

  def destroy
    @designation = Designation.find(params[:id]) 
    @designation.destroy
  end

  private
  def param_designation
  	params.require(:designation).permit(:desig_name)
  end
end