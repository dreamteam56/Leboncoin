class AddAnnonceIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :annonce_id, :integer
  end
end
