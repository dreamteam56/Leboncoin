class AddAttachmentPictureToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :uploads, :picture
  end
end
