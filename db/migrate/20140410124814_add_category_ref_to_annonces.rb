class AddCategoryRefToAnnonces < ActiveRecord::Migration
  def change
    add_reference :annonces, :category, index: true
  end
end
