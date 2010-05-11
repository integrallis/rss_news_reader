# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rss_news_reader_session',
  :secret      => '642793677a10930b15977062b1c7d34e49f7852c7ab433eb0a13561611de74b20f56810d35bff17465bbd51f0d3a0ab1ad1c81336f926f3207368e0af29f6fff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
