require "sinatra"
require "sinatra/reloader"
require_relative "lib/hangman.rb"

enable :sessions
@new_game = Hangman.new

get "/" do
  if session[:hangman] == nil
    session[:hangman] = Hangman.new
    @disp_message = "'hangman' nil, new game!"
    #@disp_message = session[:message]
  else
    #turn
  end

  erb :index, :locals => {:disp_message => @disp_message, :guesses => @guesses, :already_guessed => @already_guessed, :word => @word, :game_board => @game_board}
end #end of get '/'

post "/" do
  if params["button"] == 'New Game'
    session[:hangman] = @new_game
    session[:message] = 'New game, begin!'
  end

  session[:message] = "You guessed #{params["text"]}"


  redirect '/'
end
