class AddPromotionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :promotion, :string
  end
end
