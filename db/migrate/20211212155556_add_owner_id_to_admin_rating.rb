class AddOwnerIdToAdminRating < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_ratings, :owner_id, :integer
    add_column :admin_ratings, :owner_type, :string
    add_column :admin_ratings, :ticket_id, :integer
  end
end
