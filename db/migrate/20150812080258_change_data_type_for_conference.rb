class ChangeDataTypeForConference < ActiveRecord::Migration
  def change
    change_column :conferences, :date, :datetime
  end
end
