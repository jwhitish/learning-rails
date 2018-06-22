require "sinatra"
require "sinatra/reloader"
require_relative "lib/caesar_cipher.rb"

get '/' do
  $result = ''
  word = params['word'].to_s
  shift = params['shift'].to_i
  if !shift.nil? && !word.nil?
    params['submit'] == 'Encrypt' ? $result = encrypt(word, shift) : $result = decrypt(word, shift)
  else
    $result = 'error!'
  end
  erb :index, :locals => {:result => $result}
end
