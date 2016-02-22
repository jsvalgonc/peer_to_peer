class InvestorPolicy < ApplicationPolicy
   #attr_reader :user, :record
  attr_reader :user, :investor
  
  def initialize(user, investor)
    @user = user
    @investor = investor
  end
  
  
  def index?
    @user.admin? || @user.finance?
  end 
  
  def show?
    @user.admin? || @user.finance? || (@user.investor? && @investor.user_id == @user.id)
  end
  
  def main?
    @user.admin? || @user.finance? || (@user.investor? && @investor.user_id == @user.id)
  end

  def create?
    user.admin? || user.finance? || user.investor?
  end

  def new?
    user.admin? || user.finance? || user.investor?
  end
  
  def new_by_user?
    @user.admin? || @user.finance? || @user.investor? 
  end

  def update?
    user.admin? || user.finance? || user.investor?
  end

  def edit?
    @user.admin? || @user.finance? || (@user.investor? && @investor.user_id == @user.id)
  end

  def destroy?
    user.admin? || user.finance?
  end
  
  def saldo?
    @user.admin? || @user.finance? || (@user.investor? && @investor.user_id == @user.id)
  end
  
  def search?
    user.admin? || user.finance?
    byebug
  end
  
end
