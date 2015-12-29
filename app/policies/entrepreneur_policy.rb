class EntrepreneurPolicy < ApplicationPolicy
   #attr_reader :user, :record
  attr_reader :user, :entrepreneur
  
  def initialize(user, entrepreneur)
    @user = user
    @entrepreneur = entrepreneur
  end
  
  
  def index?
    @user.admin? || @user.finance?
  end 
  
  def show?
    @user.admin? || @user.finance? || (@user.entrepreneur? && @entrepreneur.user_id == @user.id)
  end

  def create?
    user.admin? || user.finance? || user.entrepreneur?
  end

  def new?
    user.admin? || user.finance? || user.entrepreneur?
  end
  
  def new_by_user?
    @user.admin? || @user.finance? || @user.investor? 
  end


  def update?
    user.admin? || user.finance? || user.entrepreneur?
  end

  def edit?
    byebug
    @user.admin? || @user.finance? || (@user.entrepreneur? && @entrepreneur.user_id == @user.id)
  end

  def destroy?
    user.admin? || user.finance?
  end
  
  def saldo?
    @user.admin? || @user.finance? || (@user.entrepreneur? && @entrepreneur.user_id == @user.id)
  end
  
  def search?
    user.admin? || user.finance?
  end
  
end
