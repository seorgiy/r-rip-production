class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :author
      t.text :osoboe_mnenie

      t.timestamps
    end
  end
end
