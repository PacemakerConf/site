class UpgrateSpeakersModel < ActiveRecord::Migration
  def change
  	add_column :speakers, :surname, :string
  	add_column :speakers, :photo, :string
  	add_column :speakers, :email, :string
  	add_column :speakers, :facebook, :string
  	add_column :speakers, :linkedin, :string
  	add_column :speakers, :site, :string
  end
end
