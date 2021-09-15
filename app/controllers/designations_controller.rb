class DesignationsController < ApplicationController
  #before_action :authenticate_employer!
  before_action :find_designation ,only: [:edit , :update , :destroy]
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

  end

  def update
  	if @designation.update(param_designation)
      flash[:notice] = "#{desig_name} is  updated!!!"
  	  redirect_to '/designations'
    else
      render 'edit'
    end
  end

  def destroy
    @designation.destroy
  end

  private
  def param_designation
  	params.require(:designation).permit(:desig_name)
  end

  def find_designation
    @designation = Designation.find(params[:id]) 
  end
end