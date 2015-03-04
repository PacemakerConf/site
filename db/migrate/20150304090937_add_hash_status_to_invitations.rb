class AddHashStatusToInvitations < ActiveRecord::Migration
  def change
  	add_column :invitations, :email_hash, :string
  	add_column :invitations, :status, :integer
  end
end
