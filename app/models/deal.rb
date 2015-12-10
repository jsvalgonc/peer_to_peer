class Deal < ActiveRecord::Base
  belongs_to :investor
  belongs_to :project
end
