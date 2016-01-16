class AddMovementTypeToAccountMovements < ActiveRecord::Migration
  def change
    add_column :account_movements, :movement_type, :integer
  end
end
