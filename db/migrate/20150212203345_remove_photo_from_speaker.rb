class RemovePhotoFromSpeaker < ActiveRecord::Migration
  def change
  	remove_column :speakers, :photo
  end
end
