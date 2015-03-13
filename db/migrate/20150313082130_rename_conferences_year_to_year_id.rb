class RenameConferencesYearToYearId < ActiveRecord::Migration
  def change
  	rename_column :conferences, :year, :year_id
  end
end
