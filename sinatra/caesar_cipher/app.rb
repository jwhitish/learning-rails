require "sinatra"
require "sinatra/reloader"
require_relative "lib/caesar_cipher.rb"

get '/' do
  @result = ''
  word = params['word'].to_s
  shift = params['shift'].to_i
  if !shift.nil? && !word.nil?
    @result = encrypt(word, shift)
    if @result == nil
      @result = 'Nil!'
    end
  else
    @result = 'Please enter both text to shift and the number to shift by.'
  end
  erb :index, :locals => {:result => @result}
end


# params['submit'] == 'Encrypt' ? $result = encrypt(word, shift) : $result = decrypt(word, shift)
