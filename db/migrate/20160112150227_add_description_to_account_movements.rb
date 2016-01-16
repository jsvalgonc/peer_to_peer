class AddDescriptionToAccountMovements < ActiveRecord::Migration
  def change
    add_column :account_movements, :description, :text
  end
end
