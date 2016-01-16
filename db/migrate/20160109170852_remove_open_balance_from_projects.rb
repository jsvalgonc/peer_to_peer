class RemoveOpenBalanceFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :open_balance, :double
  end
end
