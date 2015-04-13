class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
    	t.boolean :apply_date_validation
    end
  end
end
