class AddTgUsernameToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :tg_username, :string
  end
end
