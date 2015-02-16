class AddTimeendToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :timeend, :datetime, after: :timestart
  end
end
