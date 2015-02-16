class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name
      t.string :description
      t.datetime :defaultDuration
      t.string :color
      t.string :image
      t.integer :speakerEvent

      t.timestamps null: false
    end
  end
end
