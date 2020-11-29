class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :first_name, :last_name, :province_id, :address, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :first_name, :last_name, :address, :province_id, :email, :password, :current_password) }
  end

  before_action :initialize_session
  before_action :load_cart

  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end


  def load_cart
    @cart = Product.find(session[:cart])
  end
end
