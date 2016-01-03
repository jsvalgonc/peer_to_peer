class Project < ActiveRecord::Base
  enum status: [ :open, :close, :approved ]
  after_initialize :set_default_status, :if => :new_record?
  validates :value, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :entrepreneur_id, presence: true
  validates :description, presence: true
 
  belongs_to :entrepreneur
  has_many :deals
  
  def set_default_status
    self.status ||= :open
  end

end
