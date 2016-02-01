class AddIbanToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :IBAN, :text
  end
end
