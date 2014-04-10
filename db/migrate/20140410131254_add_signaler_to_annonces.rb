class AddSignalerToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :signaler, :boolean
  end
end
