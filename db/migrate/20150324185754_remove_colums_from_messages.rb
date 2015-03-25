class RemoveColumsFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :name
    remove_column :messages, :message
  end
end
