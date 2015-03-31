class RemoveVideoandPhotoFromReport < ActiveRecord::Migration
  def change
  	remove_column :reports, :video
  	remove_column :reports, :photo
  end
end
