class Words
  def initialize 
    @name, @adjective, @noun = name, adjective, noun
  end

  def name
    ["sophia", "aiden", "emma", "jackson", "olivia", "ethan",
    "isabella", "liam", "ava", "mason", "lily", "noah",
    "zoe", "lucas", "chloe", "jacob", "mia", "jayden",
    "madison", "jack", "emily", "logan", "ella",
    "ryan", "madelyn", "george"].sample
  end

  def adjective
    ["adorable", "beautiful", "clean", "dark", "elegant", "fancy",
    "glamorous", "handsome", "light", "magnificent", "plain",
    "quaint", "shiny", "ugly", "angry", "bad", "clumsy",
    "creepy",  "dangerous", "embarrassed", "fierce",
    "grumpy", "itchy", "jittery", "nasty",
    "crafty"].sample
  end

  def noun
    ["equipment", "screwdriver", "vegetable", "badge", "bead", "sun",
    "flame", "flower", "gate", "pharmacist", "weapon", "milkshake",
    "letter", "servant", "room", "nation", "river", "crack",
    "base", "mountain", "committee", "ray", "blood",
    "rain", "name", "train"].sample
  end

  def sentence
    if ['a', 'e', 'i', 'o', 'u'].include?(@adjective[0])
      "#{@name} is an #{@adjective} #{@noun}".split('')
    else
      "#{@name} is a #{@adjective} #{@noun}".split('')
    end
  end
end
