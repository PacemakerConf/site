class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :timestart
      t.integer :conference_id
      t.integer :speaker_id
      t.integer :event_type_id

      t.timestamps null: false
    end
  end
end
