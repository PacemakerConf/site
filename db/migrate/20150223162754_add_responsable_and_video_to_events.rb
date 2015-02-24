class AddResponsableAndVideoToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :responsable, :string
  	add_column :events, :video, :string
  end
end
