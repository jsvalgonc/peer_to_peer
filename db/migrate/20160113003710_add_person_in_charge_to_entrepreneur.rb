class AddPersonInChargeToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :person_in_charge, :text
  end
end
