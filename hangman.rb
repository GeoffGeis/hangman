class Sentence
  attr_reader :puzzle, :sentence, :searchable_sentence
  
  def initialize(sentence)
      @sentence = sentence
      @searchable_sentence = sentence.split('')
      @puzzle = blank_out(sentence)
  end
  
  def get_indexes(char)
    @searchable_sentence.each_index.select do |i| 
      @searchable_sentence[i] == char 
    end
  end
  
  def replace_blanks(indexes,char)
    indexes.each do |index|
      @puzzle[index] = char
    end
  end
  
  def blank_out(sentence)
    @searchable_sentence.map do |char| 
      if char == " " 
        " " 
      else
        "_" 
      end
    end
  end
  
end

#################################################################

class Hangman
  
  def initialize
    d = Words.new
    @sentences = d.sentence
    @game_sentence = Sentence.new(@sentences)
    @guessed = []
    @tries = 6
  end

  def do_turn
    puts "Take a guess:"
    guess = gets.chomp.downcase
    while @guessed.include?(guess)
      puts "You used that one already"
      guess = gets.chomp.downcase
    end
    @guessed << guess 
    if check_guess(guess)
      true
    else
      false
    end
  end

  def do_game
    while @tries != 0
      if win?
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

  def win?
    if @game_sentence.puzzle.join(" ").include?("_")
      false
    else
      true
    end
  end
    
  def continue?
    puts "Another? (y/n)"
    choice = gets.chomp.downcase
    if choice == "y"
      reset
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

  def reset
    d = Words.new
    @sentences = d.sentence
    @game_sentence = Sentence.new(@sentences)
    @guessed = []
    @tries = 6
    do_game
  end
  
end

#################################################################

class Words

  def initialize
    name = []
    adjective = []
    noun = []
    name << "sophia"
    name << "aiden"
    name << "emma"
    name << "jackson"
    name << "olivia"
    name << "ethan"
    name << "isabella"
    name << "liam"
    name << "ava"
    name << "mason"
    name << "lily"
    name << "noah"
    name << "zoe"
    name << "lucas"
    name << "chloe"
    name << "jacob"
    name << "mia"
    name << "jayden"
    name << "madison"
    name << "jack"
    name << "emily"
    name << "logan"
    name << "ella"
    name << "ryan"
    name << "madelyn"
    name << "george"
    adjective << "adorable"
    adjective << "beautiful"
    adjective << "clean"
    adjective << "dark"
    adjective << "elegant"
    adjective << "fancy"
    adjective << "glamorous"
    adjective << "handsome"
    adjective << "light"
    adjective << "magnificent"
    adjective << "plain"
    adjective << "quaint"
    adjective << "shiny"
    adjective << "ugly"
    adjective << "angry"
    adjective << "bad"
    adjective << "clumsy"
    adjective << "creepy"
    adjective << "dangerous"
    adjective << "embarrassed"
    adjective << "fierce"
    adjective << "grumpy"
    adjective << "itchy"
    adjective << "jittery"
    adjective << "nasty"
    adjective << "crafty"
    noun << "equipment"
    noun << "screwdriver"
    noun << "vegetable"
    noun << "badge"
    noun << "bead"
    noun << "sun"
    noun << "flame"
    noun << "flower"
    noun << "gate"
    noun << "pharmacist"
    noun << "weapon"
    noun << "milkshake"
    noun << "letter"
    noun << "servant"
    noun << "room"
    noun << "nation"
    noun << "river"
    noun << "crack"
    noun << "base"
    noun << "mountain"
    noun << "committee"
    noun << "ray"
    noun << "blood"
    noun << "rain"
    noun << "name"
    noun << "train"
    @name = name
    @adjective = adjective
    @noun = noun
  end

  def sentence
    "#{@name.sample} is a #{@adjective.sample} #{@noun.sample}"
  end

end

#################################################################

h = Hangman.new
h.do_game