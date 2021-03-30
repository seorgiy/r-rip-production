class AddApproveToInvites < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :approved, :boolean
  end
end
