class RemoveFieldUserIdFromAccountMovements < ActiveRecord::Migration
  def change
    remove_reference :account_movements, :user, index: true, foreign_key: true
  end
end
