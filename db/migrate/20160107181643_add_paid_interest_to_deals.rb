class AddPaidInterestToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :paid_interest, :integer
  end
end
