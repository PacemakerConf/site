class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.date :date

      t.timestamps null: false
    end
  end
end
