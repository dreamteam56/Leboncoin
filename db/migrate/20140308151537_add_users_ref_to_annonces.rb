class AddUsersRefToAnnonces < ActiveRecord::Migration
  def change
    add_reference :annonces, :user, index: true
  end
end
