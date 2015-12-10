class Project < ActiveRecord::Base
  enum status: [ :open, :close, :approved ]
  after_initialize :set_default_status, :if => :new_record?

  belongs_to :entrepreneur
  has_many :deals
  
  def set_default_status
    self.status ||= :open
  end

end
