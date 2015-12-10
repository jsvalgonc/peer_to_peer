class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :value
      t.text :description
      t.date :start_date
      t.integer :duration
      t.references :entrepreneur, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
