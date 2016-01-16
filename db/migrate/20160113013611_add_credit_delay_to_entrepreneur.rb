class AddCreditDelayToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :credit_delay, :boolean
  end
end
