class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_membership ,only: [:edit ,:update ,:destroy]

  def index
    @members = Membership.where(user_id: current_user.id).order(:employer_id )
  end

  def new
    @membership = Membership.new()
    @employer_email = params[:employer_email]
    $employerid = params[:employer_id]
    @users = User.where('email LIKE ?', "%#{params[:search]}%")
    @user_email = @users.pluck(:email)
    respond_to do |format|
      format.html
      format.json { render @users }
    end
  end

  def create
    @membership = Membership.new(param_member)
    @membership.employer_id = $employerid
    user_verification
    if @membership.save
      redirect_to root_path
    else
      @membership.user_role = params[:membership][:user_role]
      render 'new'
    end
  end

  def edit
  end

  def update   
    @member = @member.update(param_update)
    if @member
      redirect_to root_path
    else
      require_membership
      render 'edit'
    end
  end

  def destroy
    @member.destroy
    redirect_to root_path
  end



  private
  def param_member
    params.require(:membership).permit(:user_role , :role_id ,:employer_id)
  end

  def param_update
    params.permit(:user_role , :role_id , :id ,:user_id ,:employer_id)
  end

  def user_verification
    userid = User.find_by_email(params[:membership][:user_role])
    unless userid.nil?
      @membership.user_id = current_user.id
      @membership.user_role = userid.id
    end rescue render 'new', :alert => 'user was not found!'
  end

  def require_membership
    @member = Membership.find(params[:id])
  end
  
end
