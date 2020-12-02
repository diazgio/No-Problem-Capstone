class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def acount_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
  end
  
  def after_sign_in(_resource)
    problems_path
  end
end