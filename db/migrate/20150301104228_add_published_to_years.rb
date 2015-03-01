class AddPublishedToYears < ActiveRecord::Migration
  def change
  	add_column :years, :published, :boolean
  end
end
