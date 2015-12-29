class AccountMovement < ActiveRecord::Base
  belongs_to :investor
  
  validates :value_date, presence: true
  validates :movement_date, presence: true
  validates :value, presence: true
  
end
