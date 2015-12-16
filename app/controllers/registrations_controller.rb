class RegistrationsController < Devise::RegistrationsController
  
    def after_sign_in_path_for(resource_or_scope)
    case current_user.role
    when "investor"
        new_investor_path
    when "entrepreneur"
        new_entrepreneur_path
    else
        destroy_user_session_path
    end
  end
  
  
  

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:password, :password_confirmation, :current_password, :role)
  end
end