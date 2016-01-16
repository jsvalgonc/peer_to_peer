class AddTypeToAccountMovements < ActiveRecord::Migration
  def change
    add_column :account_movements, :type, :integer
  end
end
