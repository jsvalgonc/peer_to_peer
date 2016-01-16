class AddStatusToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :status, :integer
  end
end
