ActiveAdmin.register Invite do
  menu label: "Инвайты"
  permit_params :name, :email, :tg, :approved

  member_action :approve, method: :get do
    resource.approved = true
    resource.save!
    redirect_to collection_path, notice: "Захуячено!"
  end

  index do
    selectable_column
    column :id
    column :name
    column :email
    column :tg
    column :approved
    column :created_at, as: :string
    column :updated_at, as: :string

    actions do |invite|
      link_to I18n.t('active_admin.approve'), "#{collection_path}/#{invite.id}/approve/"
    end
  end
end
