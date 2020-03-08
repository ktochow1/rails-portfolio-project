# any file in initializers will be read once when the app starts upuse OmniAuth::Builder do
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
