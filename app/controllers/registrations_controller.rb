class RegistrationsController < Devise::RegistrationsController
  
  protected 

  def after_sign_up_path_for(resource)
   	 session.delete(:return_to) || current_user
  end
   
  def after_update_path_for(resource)
   	root_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end
