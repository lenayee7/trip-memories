class ApplicationController < ActionController::Base
	add_flash_types :success, :warning, :danger, :info, :notice, :error, :alert
	before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # def configure_permitted_parameters
  # devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:name, :email, :password, :avatar) }
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :avatar])
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :avatar) }
    # devise_parameter_sanitizer.for(:account_update, keys: [:name, :email, :password, :current_password, :avatar])
  end
  # end

end
