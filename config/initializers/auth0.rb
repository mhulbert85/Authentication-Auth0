Rails.application.config.middleware.use OmniAuth::Builder do
  env = Rails.application.credentials
  provider(
    :auth0,
    env.auth0.client,
    env.auth0.secret,
    env.auth0.domain,
    callback_path: "/auth/auth0/callback",
    authorize_params: {
      scope: "openid profile",
    },
  )
end
