class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :url

      t.timestamps
    end
  end
end
