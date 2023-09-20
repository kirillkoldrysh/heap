module MathHelper
  def multiply_by_two(n)
    return n * 2
  end
end

class Homework
  include MathHelper
end

h = Homework.new
puts h.multiply_by_two(5)

class Mammal
  def heartbeats?
    true
  end
end

class Dog < Mammal
end

d = Dog.new
puts d.methods.include?(:heartbeats?)
puts d.heartbeats?

class BaseballPlayer
  def initialize(hits, walks, at_bats)
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def on_base_percentage
    return ((@hits + @walks).to_f / @at_bats)
  end

  def batting_overage
    return (@hits.to_f / @at_bats)
  end
end

player = BaseballPlayer.new(220, 115, 1125)
puts player.on_base_percentage
puts player.batting_overage
