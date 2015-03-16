class AddContentToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :content, :text
    add_column :messages, :version, :integer
    add_column :messages, :name, :string
  end
end
