class AddVideoAndPhotoToConferences < ActiveRecord::Migration
  def change
  	add_column :conferences, :video, :string
    add_column :conferences, :photo, :string
  end
end
