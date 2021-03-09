class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.string :name
      t.string :email
      t.string :tg

      t.timestamps
    end
  end
end
