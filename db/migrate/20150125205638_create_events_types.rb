class CreateEventsTypes < ActiveRecord::Migration
  def change
    create_table :events_types do |t|
      t.string :eventstype

      t.timestamps null: false
    end
  end
end
