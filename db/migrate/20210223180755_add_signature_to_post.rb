class AddSignatureToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :signature, :string
  end
end
