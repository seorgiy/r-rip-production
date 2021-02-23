module Api
  module V1
    class ArtifactsController < ApiController
      def index
        page = params[:page].to_i
        artifacts = Artifact.offset(20*(page)).limit(20).order(created_at: :desc)
        render jsonapi: artifacts,
        fields: { artifacts: [:text] }, class: { Artifact: Api::V1::SerializableArtifact }
      end

      # def show
      #     render jsonapi: Artifact.find(params[:id]), class: { Artifact: Api::V1::SerializableArtifact }
      # end

      def create
        artifact = Artifact.create(artifact_params)

        render jsonapi: artifact,
        fields: { artifacts: [:title] }, class: { Artifact: Api::V1::SerializableArtifact }
      end

      # def update
      #   Artifact = Artifact.find(params[:id])
      #   Artifact.update!(text: params[:text], signature: params[:signature], author: params[:author])

      #   render jsonapi: Artifact, include: [:author],
      #   fields: { Artifacts: [:text] }, class: { Artifact: Api::V1::SerializableArtifact }
      # end

      private

      def artifact_params
        params.permit(:title, :public_url, :s3_url, :description,:additional)
      end
    end
  end
end
