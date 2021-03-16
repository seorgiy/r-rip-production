class AddPreviewToArtifacts < ActiveRecord::Migration[6.1]
  def change
    add_column :artifacts, :force_preview, :string
  end
end
