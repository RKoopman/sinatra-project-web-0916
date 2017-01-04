require 'bundler/setup'
require_relative '../keys_list'

Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'
