Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'lnHwrG0s9n7TjLTRDjk8zhjejeTcSpxS',
    'oXXFy05ZZnM_OmI_S1VU5bSUzl8GGCmc7FMWjzzaUwm4lcDUb3G3ATSgfHi8_ms0',
    'middleground.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end