class AddOtherDebtYearToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :other_debt, :integer
  end
end
