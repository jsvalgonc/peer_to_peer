class AddRegisteredToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :registered, :boolean
  end
end
