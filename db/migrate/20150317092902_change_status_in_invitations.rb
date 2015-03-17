class ChangeStatusInInvitations < ActiveRecord::Migration
  def change
  	change_column :invitations, :status, :string
  end
end
