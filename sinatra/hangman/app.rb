require "sinatra"
require "sinatra/reloader"
require_relative "lib/hangman.rb"

enable :sessions
set :session_secret, "super_secret"
@new_game = Hangman.new

before do #rbp
  puts '[Params]'
  p params
end

get "/" do
  if session[:id] == nil
    session[:id] = rand(100)
    @disp_message = "'hangman' nil, new game!" #rbp
    set_state
  else
    #turn
    @disp_message = "You guessed '#{session[:message]}'"
  end

  erb :index, :locals => {:disp_message => @disp_message, :guesses => @guesses, :already_guessed => @already_guessed, :word => @word, :game_board => @game_board}
end #end of get '/'

post "/" do
  if params["button"] == "New Game"
    #session[:hangman] = @new_game
    session.clear
  else
    #session[:hangman].playGame
    session[:guess] = params[:text]
    session[:message] = session[:guess]
  end
  redirect '/'
end #end post '/'

helpers do
  def set_state
    session[:word] = @word
    session[:guesses] = @guesses
    session[:already_guessed] = @already_guessed
    session[:game_board] = @game_board
    session[:guess] = @guess
  end
end
