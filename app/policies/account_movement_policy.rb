class AccountMovementPolicy < ApplicationPolicy
  attr_reader :user, :record
  
  def index?
    user.admin? || user.finance?|| user.investor?
  end

  def show?
    user.admin? || user.finance? || (user.investor? || Investor.find_by_user_id(user.id).id==record.id )
  end

  def create?
    user.admin? || user.finance? || user.investor?
  end
  

  def new?
    user.admin? || user.finance? || user.investor?
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
    user.admin? || user.finance? || user.investor?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?||user.finance?
        scope.all
      else
        investor=Investor.find_by_user_id(@user.id)
        @scope.where(investor_id: investor.id)
      end
    end
  end
  
  
  
#  class Scope < Scope
#    def resolve
#      #scope.where(user: user)
#      if user.admin? || user.finance? then
#        scope.where(investor_id: :all)
#      else
#        scope.where(investor_id:  Investor.find_by_user_id(user.id).id)
#      end
#    end
#  end
end