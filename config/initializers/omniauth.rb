OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '151903225009437', '42b45df236188ab6fa08119ad3567d43'
end