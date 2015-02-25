class AddContactLocationTable < ActiveRecord::Migration
   def change
    create_table :contacts_locations, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :location, index: true
    end
  end
end
