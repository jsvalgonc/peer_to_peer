class Investor < ActiveRecord::Base
  
has_many :account_movements

def self.search(search)
  if search
    where('full_name LIKE ?', "%#{search}%")
  else
    all
  end
end

    
    
end
