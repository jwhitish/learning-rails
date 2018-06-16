require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = rand(101)
  erb:index, :locals => {:number => number}
end
