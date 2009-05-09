# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_theyworkforeu_session',
  :secret      => 'cf14cc3227067e7249044269943c1a64d6361bb2555057718e6bb7884e1f43f15710876b6cb93393c49b0b3d603e4a5c64421b83fd809ea8623a61a154378b7e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
