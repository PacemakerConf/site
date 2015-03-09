class ChangeReportsConferenceidType < ActiveRecord::Migration
  def change
  	change_column :reports, :conference_id,  :integer 
  end
end
