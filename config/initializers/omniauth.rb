Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '519903674872413', '78a32015bfb54f420c97a0bbdaa7af2f',   scope: 'email', info_fields: 'email, first_name, last_name'
end