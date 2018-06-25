require "sinatra"
require "sinatra/reloader"
#require_relative "lib/hangman.rb"

enable :sessions


get "/" do

  erb :index, :locals => {}
end

post "/" do

end
