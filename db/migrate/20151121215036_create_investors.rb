class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :full_name
      t.string :address
      t.string :zip_code
      t.string :town
      t.string :country
      t.string :NIF

      t.timestamps null: false
    end
  end
end
