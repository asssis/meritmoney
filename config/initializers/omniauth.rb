Rails.application.config.middleware.use OmniAuth::Builder do
    ENV["GOOGLE_CLIENT_SECRET"]='WnO8SCJE6rW222thc9mlkDw2'
    ENV["GOOGLE_CLIENT_ID"]='879658048775-2gobq6e3imis2a0brii0a751aq5gumsm.apps.googleusercontent.com'
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
