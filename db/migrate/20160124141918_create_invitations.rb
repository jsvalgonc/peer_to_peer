class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user, index: true, foreign_key: true
      t.text :inv_key
      t.date :used_date
      t.boolean :used
      t.text :email

      t.timestamps null: false
    end
  end
end
