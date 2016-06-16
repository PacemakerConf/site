class AddMaterialsLinkToEvents < ActiveRecord::Migration
  def change
    add_column :events, :materials_link, :string
  end
end
