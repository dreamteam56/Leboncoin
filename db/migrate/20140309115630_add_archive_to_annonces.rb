class AddArchiveToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :archive, :bool
  end
end
