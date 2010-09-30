# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hotel_session',
  :secret      => 'f6a72241ea3ff9884193c808b28805ef8b93e8a064c7f4925e8be8bb6a5e137a277eef7c699eb8077ac0987d005dd8e0f172b1e8cf8afd325450b022458a6b41'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
