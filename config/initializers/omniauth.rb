Rails.application.config.middleware.use OmniAuth::Builder do
    ENV["GOOGLE_CLIENT_SECRET"]='WYp0tO-1Ck43DY5T59iJ4Kvt'
    ENV["GOOGLE_CLIENT_ID"]='242278242806-h26c9aargobttri4sclsrr9shnp2d3f3.apps.googleusercontent.com'
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
