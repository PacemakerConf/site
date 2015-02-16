class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
