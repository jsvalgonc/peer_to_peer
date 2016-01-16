class CreateAppParameters < ActiveRecord::Migration
  def change
    create_table :app_parameters do |t|
      t.string :parameter
      t.string :value

      t.timestamps null: false
    end
  end
end
