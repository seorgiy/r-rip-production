class Api::V1::SerializableArtifact < JSONAPI::Serializable::Resource
  type 'artifact'

  attributes :title, :public_url, :s3_url, :description

  attribute :additional do
    JSON.parse(@object.additional) unless @object.additional.nil?
  end
end
