class RegistrationsController < Devise::RegistrationsController
  
    def after_sign_in_path_for(resource_or_scope)
       @user=User.find_by_id(resource_or_scope)
      case current_user.role
      when "investor" 
        investor_new_by_user_path(:user_id => @user.id)
      when "entrepreneur"
        entrepreneur_new_by_user_path(:user_id => @user.id)
      else
        destroy_user_session_path
      end
    end
    
    def new
      #verifica se o código existe e se ainda não foi usado
      #se estiver errado ou já tiver sido usado reencaminha para uma mensagem e não permite o acesso
      #se o código ainda não tiver sido utilizado, actualiza o registo como usado e permiti cria o utilizador
      @inv_key = params[:inv_key]
      invitation = Invitation.find_by_inv_key(@inv_key)

      if invitation.blank?
          respond_to do |format|
              format.html { redirect_to root_path, notice: 'Codigo Invalido' }
              format.json { head :no_content }
          end
      else
          if invitation.registered?
              respond_to do |format|
                  format.html { redirect_to root_path, notice: 'Codigo já utilizado' }
                  format.json { head :no_content }
              end
          else

              super
          end
      end
    end
    
    def create
      inv_key = params[:inv_key]
      invitation = Invitation.find_by_inv_key(inv_key)
      invitation.registered = 't'
      invitation.used_date = DateTime.now.to_date
      invitation.save
      super
    end
      
  def user_code
  end
  
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:password, :password_confirmation, :current_password, :role, :ink_key)
  end
end