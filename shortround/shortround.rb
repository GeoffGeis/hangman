require './sentence/sentence.rb'
require './hangman_4.rb'

class ShortRound < Hangman
  attr_accessor(:game_sentence, :guessed, :guesses, :tries)

  def initialize(guess, game_sentence, guessed, tries)
    @game_sentence = game_sentence
    @guessed = []
    @guess = guess
    @tries = tries
    if do_turn
      puts "yay"
    else
      @tries -= 1
    end
  end

  def do_turn
    @guessed << @guess
    if check_guess(@guess)
      true
    else
      false
    end
  end

  def check_guess(guess)  
    matching_indexes = @game_sentence.get_indexes(guess)
    if matching_indexes.length == 0
      return false
    else
      @game_sentence.replace_blanks(matching_indexes,guess)
      return true
    end
  end
end


