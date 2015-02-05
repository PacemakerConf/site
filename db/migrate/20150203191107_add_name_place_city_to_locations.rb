class AddNamePlaceCityToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :place_type, :string, :first => true
  	add_column :locations, :name, :string, :after => :place_type
  	add_column :locations, :city, :string, :after => :name
  end
end
