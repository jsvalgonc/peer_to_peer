class AddStartYearToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :start_year, :integer
  end
end
