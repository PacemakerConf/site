class AddLinksToConf < ActiveRecord::Migration
  def change
  	add_column :conferences, :report, :string
  	  	add_column :conferences, :location, :string
  	  	  	add_column :conferences, :photo, :string
  	  	  		add_column :conferences, :video, :string

  end
end
