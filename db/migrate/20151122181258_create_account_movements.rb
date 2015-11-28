class CreateAccountMovements < ActiveRecord::Migration
  def change
    create_table :account_movements do |t|
      t.references :user, index: true, foreign_key: true
      t.date :value_date
      t.date :movement_date
      t.decimal :value

      t.timestamps null: false
    end
  end
end
