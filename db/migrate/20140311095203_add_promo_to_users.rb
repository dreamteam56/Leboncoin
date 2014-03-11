class AddPromoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :promo, :integer
  end
end
