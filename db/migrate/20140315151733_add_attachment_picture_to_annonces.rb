class AddAttachmentPictureToAnnonces < ActiveRecord::Migration
  def self.up
    change_table :annonces do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :annonces, :picture
  end
end
