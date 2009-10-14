# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prawnto-example_session',
  :secret      => '359d0c8312b44d03e74d21fd42c6907bb96ec8391b6502910522999e23637f2187bfe80de7922801ccda4e6fc2eaea5ed2c0e414a36650be40fc754ca5ca8a6d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
