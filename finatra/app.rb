require 'Gemfile'
require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:finatra.sqlite3"

get "/" do
  "Welcome to Finatra!"
end
