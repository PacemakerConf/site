class ChangeReportsConferenceidType < ActiveRecord::Migration
  # def up
  #   connection.execute(%q{
  #     alter table reports
  #     alter column conference_id
  #     type integer using cast(conference_id as integer)
  #   })
  # end

  # def down
  #   connection.execute(%q{
  #     alter table reports
  #     alter column conference_id
  #     type string using cast(conference_id as string)
  #   })
  # end

 def change
 	change_column :reports, :conference_id,  :integer 
 end
end
