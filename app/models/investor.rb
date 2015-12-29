class Investor < ActiveRecord::Base
has_many :account_movements
has_many :deals
belongs_to :user
validates :full_name, presence: true
validates :address, presence: true
validates :zip_code, presence: true
validates :town, presence: true
validates :country, presence: true
validates :fiscal_number, presence: true

validates_format_of :zip_code,
  :with => /\A\d{4}-\d{3}?\z/,
  :message => "O codigo postal deve ter o formato 1234-123"

validates_numericality_of :fiscal_number, :message => "O número fiscal tem de ser numérico"

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
