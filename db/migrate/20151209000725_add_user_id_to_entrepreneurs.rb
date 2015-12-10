class AddUserIdToEntrepreneurs < ActiveRecord::Migration
  def change
    add_reference :entrepreneurs, :user, index: true, foreign_key: true
  end
end
