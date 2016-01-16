class AddStatusToAccountMovements < ActiveRecord::Migration
  def change
    add_column :account_movements, :status, :integer
  end
end
