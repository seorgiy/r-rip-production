class AddAttachmnetsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :attachments, :json
  end
end
