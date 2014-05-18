class Sentence
  attr_reader(:puzzle, :searchable_sentence)
  
  def initialize(sentence)
    @searchable_sentence = sentence.split('')
    blank_out
  end
  
  def blank_out
    @puzzle = @searchable_sentence.map { |char| char == " " ? " " : "_" }
  end

  def get_indexes(char)
    @searchable_sentence.each_index.select { |i| @searchable_sentence[i] == char }
  end
  
  def replace_blanks(indexes,char)
    indexes.each { |index| @puzzle[index] = char }
  end
end
