# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_equalurl_session',
  :secret      => '5329d754fb1237ed4768e3de6bdc3b2e0633711ded72c7534607a6030a8c546ddf1b487fb6a9753b5e0126e2eedd0cd9933aaa7323a9219f5f9ada91f5770216'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
