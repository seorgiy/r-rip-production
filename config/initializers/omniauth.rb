Rails.application.config.middleware.use OmniAuth::Builder do
  provider :telegram, Rails.application.credentials.dig(:telegram, :bot_nickname), Rails.application.credentials.dig(:telegram, :bot_token)
end
