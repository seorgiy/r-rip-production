ActiveAdmin.register Post do
  permit_params :text, :published_at, :employee_only, :approved, :attachments, :signature
  menu label: "Модерация"
  includes :user
  includes :admin_user

  form do |f|
    f.inputs do
      f.input :text
      f.input :published_at, as: :date_time_picker
      f.input :signature
      f.input :employee_only
      f.input :approved
      f.input :attachments
    end
    f.actions
  end

  member_action :approve, method: :get do
    resource.approved = true
    resource.moderator = current_admin_user.id
    resource.save!
    redirect_to collection_path, notice: "Захуячено!"
  end

  index do
    selectable_column
    column :id
    column :text
    column :signature do |post| post.get_author end
    column :employee_only
    column :approved
    column :moderator do |post| post.admin_user&.email end
    column :created_at
    column :updated_at
    column :attachments
    column :published_at, as: :string

    actions do |post|
      link_to I18n.t('active_admin.approve'), "#{collection_path}/#{post.id}/approve/"
    end
  end
end
