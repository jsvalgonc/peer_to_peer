class AccountMovement < ActiveRecord::Base
  enum movement_type: [ :deposit, :investment , :payout ,:withdrawal ]
  belongs_to :investor
  
  validates :value_date, presence: true
  validates :movement_date, presence: true
  validates :value, presence: true
  
end
