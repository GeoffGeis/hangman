require './words/words.rb'
require './sentence/sentence.rb'

class Hangman
  def initialize
    w = Words.new
    @game_sentence, @guessed, @tries = Sentence.new(w.sentence), [], 6
    do_game
  end
    
  def do_game
    while @tries != 0
      unless @game_sentence.puzzle.join(" ").include?("_")
        break
      end
      puts @game_sentence.puzzle.join(" ")
      puts "You have already guessed: #{@guessed.join(" ")}"
      puts "You have #{@tries} tries"
      if do_turn
        puts "Good guess!"
        next
      else
        puts "Failure is closer, bad guess"
        @tries -= 1
        next
      end
    end
    if @tries == 0
      puts @game_sentence.searchable_sentence.join(" ")
      puts "Game over man....game over!"
      continue?
    else
      puts @game_sentence.puzzle.join(" ")
      puts "Good jerb, you are teh winRAR!"
      continue?
    end
  end

  def do_turn
    puts "Take a guess:"
    guess = gets.chomp.downcase
    while @guessed.include?(guess)
      puts "You used that one already"
      guess = gets.chomp.downcase
    end
    @guessed << guess 
    check_guess(guess) ? true : false
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
    
  def continue?
    puts "Another? (y/n)"
    choice = gets.chomp.downcase
    initialize if choice == "y"
  end
end

h = Hangman.new
