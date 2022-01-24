require 'intuit-oauth'
class EmployersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_employer , only: [:edit , :destroy ,:show]

  def index
    @detail = Account.authorization_code_url.body
    debugger
    @employers = Employer.find(searching_employer)
  end

  def show
    @employer = Employer.find(params[:id])
    @members = Membership.where(employer_id: params[:id])
  end

  def acco
    Account.authorization_code_url
  end

  def get_acco
    get_bearer =  Account.client.token.get_bearer_token(params["code"])
    debugger
  end


  def new
    @employer = Employer.new
  end

  def create
    @employer =  Employer.new(param_employer)
    @employer.user_id = current_user.id
    if @employer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @employer = Employer.update(param_employer)
    if @employer.save
      flash[:alert] = "Employer is updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @employer.destroy
  end

  private

  def param_employer
    params.require(:employer).permit(:name ,:email ,:mobile , :address , :dob ,:doj)
  end

  def require_employer
    @employer = Employer.find(params[:id])
  end

  def searching_employer
    mem = Membership.where(user_role: current_user.id)
    emp = mem.pluck(:employer_id)
    emp1 = Employer.where(user_id: current_user.id )
    arr = emp1.ids + emp
    return arr
  end

end
