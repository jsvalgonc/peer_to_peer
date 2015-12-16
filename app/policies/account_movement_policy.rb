class AccountMovementPolicy < ApplicationPolicy
  attr_reader :user, :record
  
  def index?
    user.admin? || user.finance?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.admin? || user.finance?
  end

  def new?
    user.admin? || user.finance?
  end

  def update?
    user.admin? || user.finance?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.finance?
  end
  
  def new_id?
    user.admin? || user.finance?
  end
  
  def list_investor?
  end
  
  class Scope < Scope
    def resolve
      #scope.where(user: user)
      if user.admin? || user.finance? then
        scope.where(investor_id: :all)
      else
        scope.where(investor_id:  Investor.find_by_user_id(user.id).id)
      end
    end
  end
end