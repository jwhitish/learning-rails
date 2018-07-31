#!/usr/bin/ruby

def new_game
  @word_file = File.open('lib/5desk.txt', 'r') { |file| file.read }
  valid_words = @word_file.split.select { |word| word.length.between?(5,12) }
  @word = valid_words[rand(valid_words.size)].scan(/\w/)
  @word = @word.each { |letter| letter.downcase! }
  @guesses = 6
  @already_guessed = []
  createGameBoard
end

def createGameBoard
  @game_board = []
  @word.length.times { @game_board.push("__") }
end

def turn
  if @guesses == 0
    @disp_message = "Game Over, Man! The word was: " + @word.join.to_s
  else
    @guess = session[:guess]
    if @guess == "hint"
      hint
    elsif @guess == "cheater"
      cheater
    elsif @word.join == @guess
      @disp_message = "You win! The word was: " + @word.join
      @game_board = @word
    else
      if @word.include?(@guess)
        index = 0
        @word.each do |letter|
          if letter == @guess
            @game_board[index] = letter
            index += 1
          else
            index += 1
          end
        end
      else
        @already_guessed.push(@guess)
        @guesses -= 1
      end
    end
    game_over?
  end
end

def hint
  hint = @word[rand(@word.length - 1)]
  @disp_message = "Your hint is: " + hint.to_s
end

def cheater
  @disp_message = "The word is: " + @word.join
end

def game_over?
  if @game_board == @word
    @disp_message = "You win! The word was: " + @game_board.join.to_s
  end
  if @guesses < 0
    @disp_message = "Game Over! Out of turns."
  end
end
