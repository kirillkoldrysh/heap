require 'yaml'

class Ogre
  attr_accessor :strength, :speed, :smell

  def initialize(strength, speed, smell)
    @strength = strength
    @speed = speed
    @smell = smell
  end
end

class Dragon
  attr_accessor :strength, :speed, :color

  def initialize(strength, speed, color)
    @strength = strength
    @speed = speed
    @color = color
  end
end

class Fairy
  attr_accessor :strength, :speed, :intelligence

  def initialize(intelligence)
    @strength = 1
    @speed = 42
    @intelligence = intelligence
  end
end

class GameFile
  attr_accessor :filename

  @@filename = 'save.yml'

  def self.write(yaml)
    File.write("saves/#{@@filename}", yaml)
  end

  def self.read
    File.read("saves/#{@@filename}")
  end
end

def save_game(characters)
  GameFile.write(YAML.dump(characters))
end

def load_game
  YAML.safe_load(GameFile.read, permitted_classes: [Ogre, Dragon, Fairy])
end

characters = [
  Ogre.new(15, 3, 'like dirt'),
  Dragon.new(76, 15, 'white'),
  Dragon.new(85, 13, 'red'),
  Fairy.new(31),
  Fairy.new(19),
  Ogre.new(25, 2, 'good smell')
]

save_game(characters)
chars = load_game
p chars
