class AddOpenBalanceToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :open_balance, :decimal, :default => 0
  end
end
