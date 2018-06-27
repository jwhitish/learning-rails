require "sinatra"
require "sinatra/reloader"
require_relative "lib/hangman.rb"

enable :sessions


get "/" do
  if params['button'] == 'New Game'
    #session[:id].clear
    #set new session
    @disp_message = 'New game, begin!'
  end

  if session[:id] == nil
    #start a new game
    @disp_message = "ID nil"
  else
    #session exists
  end

  erb :index, :locals => {:disp_message => @disp_message, :guesses => @guesses, :already_guessed => @already_guessed, :word => @word, :game_board => @game_board}
end #end of get '/'

post "/" do
  @disp_message = "You guessed #{params['text']}"

  erb :index
end
