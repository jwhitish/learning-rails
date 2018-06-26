require "sinatra"
require "sinatra/reloader"
#require_relative "lib/hangman.rb"

enable :sessions


get "/" do

  erb :index, :locals => {:disp_message => @disp_message, :guesses => @guesses, :already_guessed => @already_guessed, :word => @word, :game_board => @game_board}
end

post "/" do

end


#note - session[:id].clear
#clear the session/overwrite with new session if the 'new game' button is pressed
