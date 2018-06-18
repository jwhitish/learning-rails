#http://localhost:4567/

require 'sinatra'
require 'sinatra/reloader'

$number = rand(100)
$background = 'white'
$remaining_guesses = 5

get '/' do

  if $remaining_guesses == 1
    message = "Out of guesses! Number reset."
    $remaining_guesses = 5
    $number = rand(100)
  else
    message = check_guess(params["guess"])
  end

  erb :index, :locals => {:number => $number, :message => message, :background => $background, :remaining_guesses => $remaining_guesses}
end #end get / route

def check_guess(guess)
  if guess.nil?
    return
  else
    if guess == "cheater"
      $remaining_guesses -= 1
      message = "The number is #{$number}"
    elsif guess.to_i > $number + 5
      $remaining_guesses -= 1
      $background = '#FF0000'
      message = "Way too high!"
    elsif guess.to_i < $number  - 5
      $remaining_guesses -= 1
      $background = '#0000FF'
      message = "Way too low!"
    elsif guess.to_i > $number
      $remaining_guesses -= 1
      $background = '#FF9473'
      message = "Too high!"
    elsif guess.to_i < $number
      $remaining_guesses -= 1
      $background = '#8888f8'
      message = "Too low!"
    else
      $background = '#008000'
      message = "Correct! The secret number was #{$number}."
    end
  end
end
