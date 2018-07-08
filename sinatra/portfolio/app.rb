require "sinatra"
require "sinatra/reloader" if development?
require_relative "lib/hangman.rb"
require_relative "lib/caesar_cipher.rb"
require_relative "lib/mortgage_calc.rb"

enable :sessions
set :session_secret, "super_secret", :expire_after => 3600 #1hr in seconds

# before do
#   puts '[Params]'
#   p params
# end

get "/" do
  erb :index
end

get "/pomodoro" do
  msg ="WORK"
  pom_status = "Stopped"
  erb :pomodoro, :locals => { :msg => msg, :pom_status => pom_status}
end

get "/mortgage_calc" do
  if params['button'] == 'Submit'
    dnpmt = params['dnpmt'].to_i
    principle = params['prin'].to_i
    rate = params['rate'].to_i
    period = params['period'].to_i
    $payment = mortgage_calc(dnpmt, principle, rate, period)
  else
    $payment = ""
  end
  erb :mortgage_calc, :locals => {:payment => $payment}
end

get "/caesar_cipher" do
  @result = ''
  word = params['word'].to_s
  shift = params['shift'].to_i
  if !shift.nil? && !word.nil?
    params['mode'] == 'Encrypt' ? @result = encrypt(word, shift) : @result = decrypt(word, shift)
    if @result.nil?
      @result = 'Nil!'
    end
  else
    @result = 'Please enter both text to shift and the number to shift by.'
  end
  erb :caesar_cipher, :locals => {:result => @result}
end

get "/hangman" do
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

  erb :hangman, :locals => {:disp_message => @disp_message, :guesses => @guesses, :already_guessed => @already_guessed, :word => @word, :game_board => @game_board}
end #end of get '/'

post "/hangman" do
  if params["button"] == "New Game"
    session.clear
  else
    session[:guess] = params[:text]
    session[:message] = session[:guess]
  end
  redirect "/hangman"
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
