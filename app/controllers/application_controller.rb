class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def after_sign_in_path_for(resource_or_scope)
    case current_user.role
    when "admin"      
        main_admin_path
    when "investor"
        @investor=Investor.find_by_user_id(current_user.id)
        investor_path(@investor.id)
    when "entrepreneur"
        @entrepreneur=Entrepreneur.find_by_user_id(current_user.id)
        entrepreneur_path(@entrepreneur.id)
    else
        destroy_user_session_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def main_admin
  end
  
  protect_from_forgery with: :exception

end
