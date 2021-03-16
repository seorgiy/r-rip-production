class DeletePreviewFromArtifacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :artifacts, :force_preview
  end
end
