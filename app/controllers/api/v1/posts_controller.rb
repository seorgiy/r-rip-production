module Api
  module V1
    class PostsController < ApiController
      def index
        page = params[:page].to_i
        posts = Post.approved.offset(20*(page)).limit(20).order(created_at: :desc)
        render jsonapi: posts, include: [:author],
        fields: { posts: [:text] }, class: { Post: Api::V1::SerializablePost }
      end

      def show
          render jsonapi: Post.find(params[:id]), class: { Post: Api::V1::SerializablePost }
      end

      def create
        post = Post.new(text: params[:text], signature: params[:signature], author: params[:author], attachments: params[:attachments])
        post.save!

        render jsonapi: post, include: [:author],
        fields: { posts: [:text] }, class: { Post: Api::V1::SerializablePost }
      end

      def update
        post = Post.find(params[:id])
        post.update!(text: params[:text], signature: params[:signature], author: params[:author], attachments: params[:attachments])

        render jsonapi: post, include: [:author],
        fields: { posts: [:text] }, class: { Post: Api::V1::SerializablePost }
      end
    end
  end
end
