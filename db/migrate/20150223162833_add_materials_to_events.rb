class AddMaterialsToEvents < ActiveRecord::Migration
  def self.up
    add_attachment :events, :materials
  end

  def self.down
    remove_attachment :events, :materials
  end
end
