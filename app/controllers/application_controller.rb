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
        investor_main_path(@investor.id)
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
  
  def close_month
    #calcula a prestações a cobrar no mês
    byebug
    @current_date = current_date
    @process_number = get_process_number
    calculate_installments
    #faz "rodar" o mês
    respond_to do |format|
      format.html { redirect_to main_admin_path, notice: 'Prestações Calculadas.' }
    end
    #faz resumo do movimento realizado
  end
  
  def calculate_installments
    #vai buscar a data
    byebug
     @projects = Project.where("status=" + Project.statuses[:open].to_s + " AND start_date<Datetime('" + @current_date.strftime("%Y-%m-%d") +"') AND end_date>Datetime('" + @current_date.strftime("%Y-%m-%d") +"')") 
    #vai buscar todos os projecto vivos à data
    @projects.each do |project|
      installment = Installment.new
      installment.project_id = project.id
      installment.value = project.installment
      installment.reference_date = @current_date
      installment.interest = project.open_balance * project.interest_rate/12
      installment.capital =  project.installment - installment.interest
      installment.status = :generated
      installment.process_number = @process_number
      installment.save
    end
    
    #byebug
    #percorre todos os projecto
    #   para cada um, insere um registo de na tabela das prestações 


  end 
  
  protect_from_forgery with: :exception

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  
  def current_date
    #update app_parameters set value="2016-01-01" where id=1;
    return DateTime.parse(AppParameter.where(:parameter => "CurrentMonth").limit(1).pluck(:value).to_s)
  end
  
  def get_process_number
    byebug
    ipn= AppParameter.where(:parameter => "installment_process_number").first
    process_number = ipn.value.to_f
    next_process_number = process_number+1
    ipn.value=next_process_number
    ipn.save
    return process_number
  end


  
end

