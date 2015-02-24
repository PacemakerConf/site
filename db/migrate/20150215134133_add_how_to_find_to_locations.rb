class AddHowToFindToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :how_to_find, :text
  end
end
