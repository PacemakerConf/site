class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name
      t.string :description
      t.integer :defaultDuration
      t.string :color
      t.integer :image
      t.integer :speakerEvent

      t.timestamps null: false
    end
  end
end
