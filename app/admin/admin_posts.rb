ActiveAdmin.register Post do
  menu label: "Модерация"
  includes :user
  includes :admin_user

  form do |f|
    f.inputs do
      f.input :user
      f.input :text
      f.input :published_at, as: :datepicker
      f.input :signature
      f.input :employee_only
      f.input :approved
      f.input :attachments
    end
    f.actions
  end

  member_action :update, method: :post do
    new_post = params[:post]
    resource.update!(
      signature: new_post[:signature],
      text: new_post[:text],
      author:  new_post[:author],
      employee_only: new_post[:employee_only] == '1' ? true : false,
      approved: new_post[:approved] == '1' ? true : false,
      moderator: current_admin_user.id,
      attachments: new_post[:attachments],
      published_at: new_post[:published_at],
      updated_at: Time.now
    )

    redirect_to collection_path, notice: "Обновил!"
  end

  member_action :create, method: :post do
    new_post = params[:post]
    Post.new(
        signature: new_post[:signature],
        text: new_post[:text],
        author:  new_post[:author],
        employee_only: new_post[:employee_only] == '1' ? true : false,
        approved: new_post[:approved] == '1' ? true : false,
        moderator: current_admin_user.id,
        attachments: new_post[:attachments],
        published_at: new_post[:published_at],
        updated_at: Time.now
    ).save!

    redirect_to collection_path, notice: "Обновил!"
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
    column :published_at

    actions do |post|
      link_to I18n.t('active_admin.approve'), "#{collection_path}/#{post.id}/approve/"
    end




  end
end
