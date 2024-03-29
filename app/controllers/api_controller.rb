  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

     rescue_from ActiveRecord::RecordNotFound do |e|
      render_json_error :not_found, e.class.to_s, e.message
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      errors =  e.record.errors.messages
      errors = errors.map { |error| error.last.join(', ')}
      render_json_error :unprocessable_entity , e.class.to_s, errors.join(', ').capitalize
    end

    rescue_from JSON::ParserError do |e|
      render_json_error :unprocessable_entity , e.class.to_s, e.message
    end

     rescue_from ActionController::ParameterMissing do |e|
      render_json_error :forbidden , e.class.to_s, e.message
    end

    def route_not_found
      return render_json_error :bad_request, 'Bad Request', "These aren't the droids you're looking for." if request.port != "1488"

      render_json_error :bad_request, 'Bad Request', "You can't sent #{request.method}-request to: #{params[:unmatched]}"
    end
  end
