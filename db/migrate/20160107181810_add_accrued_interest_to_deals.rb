class AddAccruedInterestToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :accrued_interest, :integer
  end
end
