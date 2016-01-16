class RemoveFieldTypeFromAccountMovements < ActiveRecord::Migration
  def change
    remove_column :account_movements, :type, :integer
  end
end
