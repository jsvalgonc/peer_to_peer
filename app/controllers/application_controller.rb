class ApplicationController < ActionController::Base
  require 'date'
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def after_sign_in_path_for(resource_or_scope)
    case current_user.role
    when "admin"      
        main_admin_path
    when "investor" 
        @investor=Investor.find_by_user_id(current_user.id)
        if current_user.agent then
          agent_main_path(current_user.id)
        else
          investor_main_path(@investor.id)
        end
    when "entrepreneur"
        @entrepreneur=Entrepreneur.find_by_user_id(current_user.id)
        entrepreneur_main_path(@entrepreneur.id)
    when "finance"
        main_admin_path
    else
        destroy_user_session_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def main_admin
    #current_month= DateTime.parse(AppParameter.where(:parameter => "CurrentMonth").limit(1).pluck(:value).to_s)
    @current_month = current_date.strftime('%m/%y')
  end
  
  def main_agent
    @invitations_unsend = Invitation.where(user_id: current_user, used: "f" )
    #@invitations_send = Invitation.where(user_id: current_user, used: "t", "registered <> 't'" )
    @invitations_send = Invitation.where("user_id = ? and used <> 'f' and (registered <> 't' or registered IS NULL)",  current_user )
    @invitations_answered = Invitation.where(user_id: current_user, used: "t", registered: "t"  )
  end
  
  
  def close_month
    #calcula a prestações a cobrar no mês
    @current_date = current_date_and_increment
    @process_number = get_process_number_and_increment
    calculate_installments
    #faz "rodar" o mês
    respond_to do |format|
      format.html { redirect_to main_admin_path, notice: 'Prestações Calculadas.' }
    end
    #faz resumo do movimento realizado
  end
  
  def calculate_installments
    #vai buscar a data
     @projects = Project.where("status=" + Project.statuses[:open].to_s + " AND start_date<Datetime('" + @current_date.strftime("%Y-%m-%d") +"') AND end_date>Datetime('" + @current_date.strftime("%Y-%m-%d") +"')") 
    #vai buscar todos os projecto vivos à data
    @projects.each do |project|
      installment = Installment.new
      installment.project_id = project.id
      installment.value = project.installment
      installment.reference_date = @current_date
      installment.interest = project.open_balance * project.interest_rate/12
      installment.capital =  project.installment - installment.interest
      installment.status = :open
      installment.process_number = @process_number
      installment.used = 'f'
      installment.registered = 'f'
      installment.save
      project.open_balance=project.open_balance - installment.capital
      project.save
    end
    
    #byebug
    #percorre todos os projecto
    #   para cada um, insere um registo de na tabela das prestações 


  end 
  
  def test_write_file
    sf= SepaFile.new
    sf.WriteFile
    respond_to do |format|
      format.html { redirect_to main_admin_path, notice: 'Gerado Ficheiro SEPA' }
    end
  end
  
  #def send_mail
  #  byebug
  #  #@invitation = Invitation.find_by_id(21)
  #  InvitationMailer.invitation_email().deliver
  #  respond_to do |format|
  #    format.html { redirect_to agent_main_path(current_user.id), notice: 'mail' }
  #  end
  #end
  
  protect_from_forgery with: :exception

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  
  def current_date
     return DateTime.parse(AppParameter.where(:parameter => "CurrentMonth").first.value)
  end
  
  def current_date_and_increment
    #update app_parameters set value="2016-01-01" where id=1;
    r_cm=AppParameter.where(:parameter => "CurrentMonth").first
    cm= DateTime.parse(r_cm.value)
    r_cm.value = cm + 1.months
    r_cm.save
    return cm
  end
  
  def get_process_number_and_increment
    ipn= AppParameter.where(:parameter => 'InstallmentProcessNumber').first
    process_number = ipn.value.to_f
    next_process_number = process_number+1
    ipn.value=next_process_number
    ipn.save
    return process_number
  end

end

