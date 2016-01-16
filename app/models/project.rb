class Project < ActiveRecord::Base
  enum status: [ :pending, :subscription, :open, :close ]
  after_initialize :set_default_status, :if => :new_record?
  validates :value, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :entrepreneur_id, presence: true
  validates :description, presence: true
 
  belongs_to :entrepreneur
  has_many :deals
  
  def set_default_status
    self.status ||= :pending
  end


end
