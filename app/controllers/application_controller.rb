class ApplicationController < ActionController::Base
  def render_json_error(status, type, message, extra = {})
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol

    error = {
      type: type,
      error: message,
      status: status
    }.merge(extra)

    render json: { errors: [error] }, status: status
  end
end
