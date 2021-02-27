class Api::V1::SerializablePost < JSONAPI::Serializable::Resource
  type 'post'
  attributes :text, :created_at, :published_at, :updated_at

  attribute :attachments do
    if @object.attachments.attached?
      @object.attachments.map do |attachment|
        if Rails.env.production?
          {
            400 => attachment.variant(resize_to_limit: [400, 400]).processed.url,
            800 => attachment.variant(resize_to_limit: [800, 800]).processed.url
          }
        else
          {
            400 => Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true),
            800 => Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true)
          }
        end
      end
    else
      []
    end
  end

  attribute :signature do
    @object.get_author
  end
end
