class Api::V1::SerializablePost < JSONAPI::Serializable::Resource
  type 'post'
  attributes :text, :created_at, :published_at, :updated_at

  attribute :signature do
    @object.get_author
  end
end
