class AddOpenBalanceToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :open_balance, :double, :default => 0
  end
end
