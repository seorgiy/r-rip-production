ActiveAdmin.register Post do
  menu label: "Модерация"

  member_action :update, method: :put do
    new_post = params[:post]
    resource.update!(
      text: new_post[:text],
      author:  new_post[:author],
      employee_only: new_post[:employee_only] == '1' ? true : false,
      updated_at: Time.now
    )

    redirect_to resource_path, notice: "Обновил!"
  end

  member_action :approve, method: :get do
    resource.approved = true
    resource.moderator = current_admin_user.id
    resource.save!
    redirect_to '/admin/posts', notice: "Захуячено!"
  end

  index :title => "Посты" do

    selectable_column
    column :id
    column :text
    column :author do |post|
      User.find(post.author).email if post.author.present?
    end
    column :employee_only
    column :approved
    column :moderator do |post|
    AdminUser.find(post.moderator).email if post.moderator.present?
    end
    column :created_at
    column :updated_at

    actions do |post|
      item "Аппрувнуть", "/admin/posts/#{post.id}/approve/"
    end


  end


  # permit_params :text, :author
  # everything happens here :D
end
