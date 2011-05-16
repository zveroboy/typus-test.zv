Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'godauUCSzHMoyowDlh8dOw', 'pkw6tkQMLAnjnQwUhLExTVV8YENjfefxKmNeoNYTXY'
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :vkontakte, '2330301', '8F8ZCbHZSc0T1N9Cr0OD'
end