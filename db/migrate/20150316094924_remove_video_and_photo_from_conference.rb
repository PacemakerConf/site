class RemoveVideoAndPhotoFromConference < ActiveRecord::Migration
  def change
  	remove_column :conferences, :video
  	remove_column :conferences, :photo
  end
end
