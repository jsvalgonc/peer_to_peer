class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table :entrepreneurs do |t|
      t.text :full_name
      t.text :address
      t.text :zip_code
      t.text :town
      t.text :country
      t.text :fiscal_number

      t.timestamps null: false
    end
  end
end
