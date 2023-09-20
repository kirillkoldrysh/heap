require 'yaml'

class Ogre
  def initialize(strength, speed)
    @strength = strength
    @speed = speed
  end

  def self.deserialize(yaml_string)
    YAML.safe_load(yaml_string, permitted_classes: [Ogre])
  end

  def serialize
    YAML.dump(self)
  end

  def to_s
    "Ogre: [strength = #{@strength}, speed = #{@speed}]"
  end
end

wendigo = Ogre.new(47, 3)
yaml = wendigo.serialize
puts "The yaml looks like this:"
p yaml
puts "It's just a boring old string: #{yaml.class}"
ogre = Ogre.deserialize(yaml)
puts "...and it's easy to change back: #{ogre}"
puts

shrek = Ogre.new(62, 12)
fiona = Ogre.new(66, 37)
ogres = [shrek, fiona]
puts "We can even serialize arrays! They're just another object. #{ogres}"
