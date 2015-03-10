class AddPublishedToConfNEvents < ActiveRecord::Migration
  def change
  	add_column :conferences, :published, :boolean
  	add_column :events, :published, :boolean
  end
end
