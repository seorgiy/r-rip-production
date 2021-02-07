module Api
  module V1
    class UsersController < ApiController

      def show
        render jsonapi: User.find(params[:id]),
        fields: { users: [:email] }, class: { User: Api::V1::SerializableUser }
      end

      def create
        user = User.new(user_params)
        user.save!

        render jsonapi: user,
        fields: { users: [:email] }, class: { User: Api::V1::SerializableUser }
      end

      private

      def user_params
        params.require(:user).permit(:password, :email)
      end
    end
  end
end
