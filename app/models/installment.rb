class Installment < ActiveRecord::Base
  belongs_to :project
  enum status: [ :open, :failed, :paid ]
end