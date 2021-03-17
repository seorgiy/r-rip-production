module Api
  module V1
    class PostsController < ApiController
      def index
        page = params[:page].to_i
        posts = Post.includes(:user).approved.offset(20*(page)).order(published_at: :desc).limit(20)
        render jsonapi: posts, class: { Post: Api::V1::SerializablePost }
      end

      def show
        render jsonapi: Post.find(params[:id]), class: { Post: Api::V1::SerializablePost }
      end

      def create
        post = Post.new(post_params)
        post.save!

        render jsonapi: post, class: { Post: Api::V1::SerializablePost }
      end

      def update
        post = Post.find(params[:id])
        post.update!(post_params)

        render jsonapi: post, class: { Post: Api::V1::SerializablePost }
      end

      def post_params
        params.except(:id).permit(:text, :signature, :author, :approved, :attachments, :published_at)
      end
    end
  end
end
