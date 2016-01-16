class AddMainActivityToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :main_activity, :text
  end
end
