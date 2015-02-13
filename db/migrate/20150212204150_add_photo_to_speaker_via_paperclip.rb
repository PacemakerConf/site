class AddPhotoToSpeakerViaPaperclip < ActiveRecord::Migration
  def self.up
    add_attachment :speakers, :photo
  end

  def self.down
    remove_attachment :speakers, :photo
  end
end
