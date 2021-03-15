class Api::V1::SerializableArtifact < JSONAPI::Serializable::Resource
  type 'artifact'

  attributes :title, :description, :url, :category, :preview

  # attribute :preview do
  #   @object.attachment.preview(resize_to_limit: [800,800]).processed.url if @object.attachment&.blob&.content_type == "video/mp4"
  # end

  attribute :additional do
    JSON.parse(@object.additional) unless @object.additional.nil?
  end
end
