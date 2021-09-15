class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = Member.where(user_id: current_user.id)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(param_member)
    userid = User.find_by_email(params[:member][:user_role])
    unless userid.nil?
      @member.user_id = current_user.id
      @member.user_role = userid.id
    end rescue render 'new', :alert => 'user was not found!'
    if @member.save
      redirect_to root_path
    else
      @member.user_role = params[:member][:user_role]
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
    params.require(:member).permit(:user_role , :role_id ,:employer_id)
  end
end
