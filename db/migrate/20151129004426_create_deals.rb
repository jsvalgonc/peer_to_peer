class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :investor, index: true, foreign_key: true
      t.references :entrepreneur, index: true, foreign_key: true
      t.integer :value
      t.boolean :confirmed
      t.date :confirmation_date

      t.timestamps null: false
    end
  end
end
