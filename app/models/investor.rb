class Investor < ActiveRecord::Base
has_many :account_movements
has_many :deals
belongs_to :user
  
  
def self.search(search)
  if search
    where('full_name LIKE ?', "%#{search}%")
  else
    all
  end
end

  
  def saldo
    saldo_investor = 0
    @account_movements=AccountMovement.where("investor_id=" + self.id.to_s)
    @account_movements.each do |account_movement|
      saldo_investor = saldo_investor + account_movement.value
    end
    saldo_investor
  end

    
    
end
