  class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound do |e|
      render_json_error :not_found, e.class.to_s, e.message
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render_json_error :unprocessable_entity , e.class.to_s, e.message
    end

    def route_not_found
      render_json_error :bad_request, 'Bad Request', "You can't sent #{request.method}-request to: #{params[:unmatched]}"
    end
  end
