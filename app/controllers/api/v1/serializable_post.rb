class Api::V1::SerializablePost < JSONAPI::Serializable::Resource
  type 'post'

  attributes :text, :created_at, :published_at, :updated_at

  attribute :author do
    user = @object.user
    { id: user&.id, email: user&.email }
  end
end
