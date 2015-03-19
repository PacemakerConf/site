class AddTwiterToSpeaker < ActiveRecord::Migration
  def change
  	add_column :speakers, :twitter, :string
  end
end
