class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  def index
    @users = User.all
  end
  
  def index_agents
    if  request.post? then
      agent_id = params[:id]
      for n in 1..10 
        inv = Invitation.new_by_agent(agent_id)
      end
      redirect_to users_agents_path, :notice => "Convites Gerados com sucesso"
    end
    @users = User.where( :agent => true)
  end
  
  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private
  
  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end


  def secure_params
    params.require(:user).permit(:role,:agent)
  end
  
  def new_user
    byebug
  end

end
