class AddInvestorIdToAccountMovements < ActiveRecord::Migration
  def change
    add_reference :account_movements, :investor, index: true, foreign_key: true
  end
end
