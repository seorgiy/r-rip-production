class AddCategoryToArtifact < ActiveRecord::Migration[6.1]
  def change
    add_column :artifacts, :category, :string
  end
end
