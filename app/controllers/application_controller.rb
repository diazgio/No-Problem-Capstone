class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:fullname, :username, :email, :password,
               :password_confirmation, :avatar, :cover_image)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:fullname, :username, :email, :password,
               :current_password, :avatar, :cover_image)
    end
  end

  def after_sign_in_path_for(_resource)
    problems_path
  end
end
