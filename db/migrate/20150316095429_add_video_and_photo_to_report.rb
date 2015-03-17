class AddVideoAndPhotoToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :video, :string
    add_column :reports, :photo, :string
  end
end
