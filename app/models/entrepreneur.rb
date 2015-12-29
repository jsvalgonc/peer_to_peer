class Entrepreneur < ActiveRecord::Base
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

end
