class Api::V1::SerializableArtifact < JSONAPI::Serializable::Resource
  type 'artifact'

  attributes :title, :description, :url, :category, :preview

  attribute :additional do
    JSON.parse(@object.additional) unless @object.additional.nil?
  end
end
