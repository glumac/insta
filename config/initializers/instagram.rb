require "instagram"

Instagram.configure do |config|
  config.client_id = "7ed95ee75c55473d873a7c31b71ec212"
  config.client_secret = "577e010c58c8464ab4f947b8d0893839"
end

::CALLBACK_URL = "http://instabrief.herokuapp.com/oauth/callback"
