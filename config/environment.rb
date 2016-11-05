require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'MPLSfYb5xV1AaqBo8WlNWw'
  config.consumer_secret = 'tv_23gXJLbOisSEOtjIocapi4oY'
  config.token = 'VHm6sjU8PSfADsehRf6nOZVV727mUYmm'
  config.token_secret = 'CxQsBpCEMC7cvQxh1UpVw_IZzx0'
end
