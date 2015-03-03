class DropTelephones < ActiveRecord::Migration
  def change
  	drop_table :telephones
  end
end
