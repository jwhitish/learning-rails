require 'sinatra'
require 'sinatra/reloader'

$number = rand(100)

get '/' do
  message = check_guess(params["guess"])
  erb :index, :locals => {:number => $number, :message => message}
end

def check_guess(guess)
  if guess.nil?
    return "Pick a number 1-100:"
  else
    if guess == "cheater"
      message = "The number is #{$number}"
    elsif guess.to_i > $number + 5
      message = "Way too high!"
    elsif guess.to_i < $number  - 5
      message = "Way too low!"
    elsif guess.to_i > $number
      message = "Too high!"
    elsif guess.to_i < $number
      message = "Too low!"
    else
      message = "Correct! The secret number was #{$number}."
    end
  end
end
