module Api
  module V1
    class FeedbacksController < ApiController

      def create
        feedback = Feedback.new(feedback_params)
        feedback.save!

        render json: { message: "я тебя услышал" }, status: :ok
      end

      private

      def feedback_params
        params.permit(:author, :osoboe_mnenie)
      end
    end
  end
end
