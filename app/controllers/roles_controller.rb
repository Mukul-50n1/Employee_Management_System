class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_role ,only: [:edit , :destroy]
  
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_param)
    if @role.save
      redirect_to root_path
    else
      flash[:notice] = "Your details has not submited"
      render 'new'
    end
  end

  def edit
  end

  def update
    @role = Role.update(require_role)
    if @role.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @role.destroy
    redirect_to root_path
  end

  
  private

  def role_param
    params.require(:role).permit(:role_name)
  end

  def require_role
    @role = Role.find(params[:id])
  end

end
