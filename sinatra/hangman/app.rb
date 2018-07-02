require "sinatra"
require "sinatra/reloader" if development?
require_relative "lib/hangman_test.rb"

enable :sessions
set :session_secret, "super_secret", :expire_after => 86400 #24hrs in seconds

# before do
#   puts '[Params]'
#   p params
# end

get "/" do
  if session[:id] == nil
    session[:id] = rand(1000)
    @disp_message = "New game, Begin!"
    new_game
    post_state
  else
    pre_state
    @disp_message = "You guessed '#{session[:message]}'"
    turn
    post_state
  end

  erb :index, :locals => {:disp_message => @disp_message, :guesses => @guesses, :already_guessed => @already_guessed, :word => @word, :game_board => @game_board}
end #end of get '/'

post "/" do
  if params["button"] == "New Game"
    session.clear
  else
    session[:guess] = params[:text]
    session[:message] = session[:guess]
  end
  redirect '/'
end #end post '/'

helpers do
  def pre_state
    @word = session[:word]
    @guesses = session[:guesses]
    @already_guessed = session[:already_guessed]
    @game_board = session[:game_board]
    @guess = session[:guess]
  end

  def post_state
    session[:word] = @word
    session[:guesses] = @guesses
    session[:already_guessed] = @already_guessed
    session[:game_board] = @game_board
    session[:guess] = @guess
  end
end
