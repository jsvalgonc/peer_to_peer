class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.references :project, index: true, foreign_key: true
      t.decimal :value
      t.date :reference_date
      t.decimal :interest
      t.decimal :capital
      t.integer :status
      t.integer :process_number

      t.timestamps null: false
    end
  end
end
