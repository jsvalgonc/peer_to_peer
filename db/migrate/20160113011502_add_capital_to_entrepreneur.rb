class AddCapitalToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :capital, :text
  end
end
