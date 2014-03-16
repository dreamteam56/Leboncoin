class RemoveUrlFromAnnonces < ActiveRecord::Migration
  def change
    remove_column :annonces, :url, :string
  end
end
