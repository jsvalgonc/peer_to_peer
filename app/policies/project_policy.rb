class ProjectPolicy < ApplicationPolicy
   #attr_reader :user, :record
  attr_reader :user, :project
  
  def initialize(user, project)
    @user = user
    @project = project
  end
  
  
  def index?
    @user.admin? || @user.finance?|| @user.entrepreneur? 
  end 
   
  def index_investor?
    @user.admin? || @user.finance?|| @user.investor? 
  end 

  
  def show?
     user.admin? || user.finance? || (user.entrepreneur? &&  Entrepreneur.find_by_user_id(@user.id).id == @project.entrepreneur_id)
  end

  def create?
    user.admin? || user.finance? || user.entrepreneur?
  end

  def new?
    user.admin? || user.finance? || user.entrepreneur?
  end
  
  def update?
    user.admin? || user.finance? || (@user.entrepreneur? && Entrepreneur.find_by_user_id(@user.id).id == @project.entrepreneur_id)
  end

  def edit?
    @user.admin? || @user.finance? || (@user.entrepreneur? && Entrepreneur.find_by_user_id(@user.id).id == @project.entrepreneur_id)
  end

  def destroy?
    user.admin? || user.finance?
  end
  
end
