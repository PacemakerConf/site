class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|

      t.string :email
      t.string :conference_id
      t.string :message_id

      t.timestamps null: false
    end
  end
end
