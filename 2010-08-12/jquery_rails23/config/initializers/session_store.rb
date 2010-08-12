# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jquery_rails23_session',
  :secret      => 'b8aece365d07cc7f989924d89c702e1c79684d08ccef097b4ebba4412fe0c297476e4174bba61a84ce3809aeaaec9b33308d7dd76922617770569c2dad83095f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
