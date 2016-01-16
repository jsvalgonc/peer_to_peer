class AddLegalNatureToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :legal_nature, :integer
  end
end
