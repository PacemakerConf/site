class RemoveVideoFromReport < ActiveRecord::Migration
  def change
  	remove_column :reports, :video
  end
end
