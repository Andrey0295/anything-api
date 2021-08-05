 Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '65af39a9bbe0b84f3a38', 'aa2b67c76a53b81021963deaf023d44a10f65000', scope: 'user,repo,gist', callback_path: '/api/v1/auth/github/callback'
  end


    OmniAuth.config.allowed_request_methods = [:post, :get]

  OmniAuth.config.silence_get_warning = true


#   config.omniauth :github, '65af39a9bbe0b84f3a38', 'aa2b67c76a53b81021963deaf023d44a10f65000', scope: 'user:email'