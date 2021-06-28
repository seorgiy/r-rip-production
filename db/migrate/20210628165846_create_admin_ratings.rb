class CreateAdminRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_ratings do |t|
      t.string :felix_admin_id
      t.string :rate
      t.text :comment
      t.timestamp :post_date

      t.timestamps
    end
  end
end
