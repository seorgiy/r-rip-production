class Api::V1::SerializablePost < JSONAPI::Serializable::Resource
  type 'post'
  attributes :text, :created_at, :published_at, :updated_at, :attachments

  attribute :attachments do
    JSON.parse(@object.attachments) unless @object.attachments.nil?
  end

  attribute :signature do
    @object.get_author
  end
end
