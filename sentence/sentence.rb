require './words/words.rb'

class Sentence
  attr_reader(:puzzle, :searchable_sentence)
  
  def initialize
    @searchable_sentence = Words.new
    @puzzle = @searchable_sentence.sentence.map { |char| char == " " ? " " : "_" }
  end

  def get_indexes(char)
    @searchable_sentence.sentence.each_index.select do |i| 
      @searchable_sentence.sentence[i] == char 
    end
  end
  
  def replace_blanks(indexes,char)
    indexes.each { |index| @puzzle[index] = char }
  end
end
