class AddOtherCostsYearToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :other_costs, :integer
  end
end
