require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = rand(101)
  "The secret number is #{number}"
end
