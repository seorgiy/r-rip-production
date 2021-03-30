class AddBigBossToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :big_boss, :boolean, default: false
  end
end
