# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_workshop_session',
  :secret      => '766733e39f1cca0571237537a782945419c8d57fe11a1a05b9e13d11dd72d85db338a8d48e1a4ecff2530103ce53dfe91213bd3e09dde8db41c21f0312efd9a9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
