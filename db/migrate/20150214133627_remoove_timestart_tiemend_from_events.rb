class RemooveTimestartTiemendFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :timestart
  	remove_column :events, :timeend
  end
end
