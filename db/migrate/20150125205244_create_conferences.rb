class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.integer :year
      t.date :date
      t.integer :attenders

      t.timestamps null: false
    end
  end
end
