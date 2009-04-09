# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_location_session',
  :secret      => 'e18931d82dcf86a02c237b158880d5c480afc5950430ba889e7e0b207938378d5b19983d9698f510e319fc9eb54b5332b5ce1fd154a667e3e5acdfd80985317f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
