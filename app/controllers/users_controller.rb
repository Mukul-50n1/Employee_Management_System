class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @employers = Employer.all
    @member = Member.new
    @members = Member.where(user_id: current_user.id)
  end
end
