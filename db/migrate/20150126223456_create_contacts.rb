class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :telephone
      t.string :email
      t.string :skype
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
