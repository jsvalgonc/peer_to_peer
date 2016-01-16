class AddPhoneNumberToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :phone_number, :text
  end
end
