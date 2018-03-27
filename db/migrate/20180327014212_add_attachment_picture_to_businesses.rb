class AddAttachmentPictureToBusinesses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :businesses do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :businesses, :picture
  end
end
