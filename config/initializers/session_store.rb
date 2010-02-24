# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rss_reader_session',
  :secret      => '51d4bc99050f5916e6ddb67fed1740fc22c16ebfe82101b521d607825dbd05b5586d97d17b7d4b8af7cbd51b41950f4de1e1db56caf90522e6ddc69e3fd5e4a8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
