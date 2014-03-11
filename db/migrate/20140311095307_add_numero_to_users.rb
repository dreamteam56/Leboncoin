class AddNumeroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numero, :string
  end
end
