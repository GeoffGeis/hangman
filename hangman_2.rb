require './words/words.rb'; './sentence/sentence.rb'

class Hangman
  def do_game
    d = Words.new
    @game_sentence = Sentence.new(d)
    guessed = []
    tries = 6
    while tries != 0
      if win?
        break
      end
      puts @game_sentence.puzzle.join(" ")
      puts "You have already guessed: #{guessed.join(" ")}"
      puts "You have #{tries} tries motherfucker!"
      if do_turn
        puts "Good guess!"
        next
      else
        puts "Failure is closer, bad guess"
        tries -= 1
        next
      end
    end
    if tries == 0
      puts @game_sentence.searchable_sentence.join(" ")
      puts "Game over man....game over!"
      continue?
    else
      puts @game_sentence.puzzle.join(" ")
      puts "Good jerb, you are teh winRAR!"
      continue?
    end
  end

  def win?
    if @game_sentence.puzzle.join(" ").include?("_")
      false
    else
      true
    end
  end

  def do_turn
    puts "Gimme a fucking guess:"
    guess = gets.chomp.downcase
    while guessed.include?(guess)
      puts "You used that one already asshat"
      guess = gets.chomp.downcase
    end
    guessed << guess 
    if check_guess(guess)
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
    
  def continue?
    puts "Another you bitch? (y/n)"
    choice = gets.chomp.downcase
    if choice == "y"
      reset
    end
  end

  def reset
    do_game
  end
end

h = Hangman.new
h.do_game