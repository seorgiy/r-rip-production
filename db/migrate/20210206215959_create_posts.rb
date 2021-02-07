class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :author
      t.boolean :employee_only, default: false
      t.integer :moderator
      t.boolean :approved
      t.date :published_at

      t.timestamps
    end
  end
end
