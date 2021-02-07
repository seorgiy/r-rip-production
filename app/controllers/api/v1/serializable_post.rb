class Api::V1::SerializablePost < JSONAPI::Serializable::Resource
  type 'post'

  attributes :text, :created_at, :published_at, :updated_at

  attribute :author do
    if @object.author.present?
      author = User.find(@object.author)
      { id: author.id, email: author.email }
    else
      nil
    end
  end
end
