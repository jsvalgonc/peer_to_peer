class AddPaidCapitalToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :paid_capital, :integer
  end
end
