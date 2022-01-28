class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    @current_ability = Ability.new(current_user)
  end

  def currents_employer()
    Employer.all.first
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:mobile,:dob,:doj,:address ,:email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email,:dob,:doj,:address ,:mobile,:password, :current_password)}
  end



  def permanent_address
    if params[:employee][:addresses_attributes][:'0'][:"chek"] == "1"
      params[:employee][:addresses_attributes][:'1'][:country] = params[:employee][:addresses_attributes][:'0'][:country]
      params[:employee][:addresses_attributes][:'1'][:state] = params[:employee][:addresses_attributes][:'0'][:state]
      params[:employee][:addresses_attributes][:'1'][:city] = params[:employee][:addresses_attributes][:'0'][:city]
      params[:employee][:addresses_attributes][:'1'][:street_address] = params[:employee][:addresses_attributes][:'0'][:street_address]
      #params[:employee][:addresses_attributes][:'1'] = params[:employee][:addresses_attributes][:'0']
    end
  end
end