class Api::V1::SerializableArtifact < JSONAPI::Serializable::Resource
  type 'artifact'

  attributes :title, :description

  attribute :additional do
    JSON.parse(@object.additional) unless @object.additional.nil?
  end

  attribute :url do
    @object.attachment.url
  end
end
