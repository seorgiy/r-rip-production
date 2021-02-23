class CreateArtifacts < ActiveRecord::Migration[6.1]
  def change
    create_table :artifacts do |t|
      t.string :type
      t.uuid :public_url
      t.uuid :s3_url
      t.text :title
      t.text :description
      t.json :additional

      t.timestamps
    end
  end
end
