class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname]) 
  end
end
