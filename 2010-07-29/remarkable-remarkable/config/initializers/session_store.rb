# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_remarkable_session',
  :secret      => 'dfc4322f3c57eeb046e61a5d129a09a5c55e8948425f161cf936746e6528a1a038ae4a09a6c9dc6d79b242bea1db38f7edb86bda6f16105f39968a98efe84776'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
