class ChangeReportsConferenceidType < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table reports
      alter column conference_id
      type integer using cast(number as integer)
    })
  end

  def down
    connection.execute(%q{
      alter table reports
      alter column conference_id
      type string using cast(number as string)
    })
  end

#  def change
#  	change_column :reports, :conference_id,  :integer 
#  end
end
