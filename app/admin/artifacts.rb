ActiveAdmin.register Artifact do
  menu label: "Музей"
  index title: "Музей"

  form create: 'Артефакт' do |f|
    f.inputs do
      input :title, label: 'Заголовок'
      input :description, label: 'Описание'
      input :additional, label: 'Жсончик'
      input :category, label: 'Категория', as: :select, :collection => Artifact.possible_categories.compact, include_blank: false
      input :attachment, as: :file, label: 'Файлик на s3'
      input :manual_preview, as: :file, label: 'Превьюха'
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :additional
      row :category
      row :url do link_to('amazon_url', artifact.url) end
      row :preview do |ad|
        image_tag ad.preview if ad.category == 'video' || ad.category == 'photo'
        audio_tag ad.url, controls: true if ad.category == 'sound'
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :additional, :attachment, :manual_preview, :category
  #
  # or
  #
  # permit_params do
  #   permitted = [:type, :title, :description, :additional]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
