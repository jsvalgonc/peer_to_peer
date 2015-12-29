class RegistrationsController < Devise::RegistrationsController
  
    def after_sign_in_path_for(resource_or_scope)
        case current_user.role
        when "investor"
            investor_new_by_user_path(:user_id => @user.id)
        when "entrepreneur"
            entrepreneur_new_by_user_path(:user_id => @user.id)
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