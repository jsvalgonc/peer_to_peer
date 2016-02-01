class AddUserCratedToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :UserCreated, :integer
  end
end
