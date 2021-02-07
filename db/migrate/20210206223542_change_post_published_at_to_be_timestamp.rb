class ChangePostPublishedAtToBeTimestamp < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :published_at, :timestamp
  end
end
