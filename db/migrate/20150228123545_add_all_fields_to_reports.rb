class AddAllFieldsToReports < ActiveRecord::Migration
  def change
  	add_column :reports, :responsable, :string
  	add_column :reports, :video, :string
  	add_column :reports, :title, :string
  	add_column :reports, :description, :string
  	add_column :reports, :conference_id, :string
  end
end
