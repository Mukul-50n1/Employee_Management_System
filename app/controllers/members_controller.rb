class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = Membership.where(user_id: current_user.id)
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(param_member)
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
  end

  def destroy
  end

  private
  def param_member
    params.require(:membership).permit(:user_role , :role_id ,:employer_id)
  end

  def user_verification
    userid = User.find_by_email(params[:membership][:user_role])
    unless userid.nil?
      @membership.user_id = current_user.id
      @membership.user_role = userid.id
    end rescue render 'new', :alert => 'user was not found!'
  end
end
