class RemoveUrlFromArtifacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :artifacts, :public_url
    remove_column :artifacts, :s3_url
  end
end
