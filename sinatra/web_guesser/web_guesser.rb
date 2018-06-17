require 'sinatra'
require 'sinatra/reloader'

$number = rand(100)
$background = 'white'
$guesses = 5

get '/' do
  message = check_guess(params["guess"])
  erb :index, :locals => {:number => $number, :message => message, :background => $background, :guesses => $guesses}
end

def check_guess(guess)
  if guess.nil?
    return
  else
    if guess == "cheater"
      message = "The number is #{$number}"
    elsif guess.to_i > $number + 5
      check_turn
      $background = '#FF0000'
      message = "Way too high!"
    elsif guess.to_i < $number  - 5
      check_turn
      $background = '#0000FF'
      message = "Way too low!"
    elsif guess.to_i > $number
      check_turn
      $background = '#FF9473'
      message = "Too high!"
    elsif guess.to_i < $number
      check_turn
      $background = '#8888f8'
      message = "Too low!"
    else
      $background = '#008000'
      message = "Correct! The secret number was #{$number}."
    end
  end
end

def check_turn
  if $guesses == 0
    $number = rand(100)
    $guesses = 5
    message = "Out of guesses! Secret number reset."
  else
    $guesses -= 1
  end
end
