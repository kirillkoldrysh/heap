class Human
  attr_accessor :health, :name

  def initialize(name, age, health, strength)
    @name = name
    @age = age
    @health = health
    @strength = strength
  end

  def get_info()
    puts "#{@name} => age: #{@age} health: #{@health}, strength: #{@strength}"
  end

  def is_dead()
    return @health <= 0
  end

  def take_damage(human)
    koef = [(rand * 6), 1].max.to_i
    damage = (koef * @strength / 3).to_i
    puts "#{@name} takes damage #{damage} to #{human.name}. #{human.name}'s health is #{human.health} now"
    human.decrease_health(damage)
  end

  def decrease_health(damage)
    @health = [@health - damage, 0].max
    puts "#{@name}: decreased health. Actual health is #{@health}"
  end

  def self.create(name, age, health, strength)
    Human.new(name, age, health, strength)
  end
end

class Viking < Human
  @@default_health = 120

  def self.create()
    age = (rand * 20 + 15).to_i
    health = [age * 5, @@default_health].max
    strength = [age / 2, 10].min.to_i
    name = self.random_name()
    return Viking.new(name, age, health, strength)
  end

  private

  def self.random_name()
    return ["Erik", "Anderson", "Lars", "Leif", "Tor", "Gustav", "Ericsson"].sample
  end
end


viking = Viking.create()
viking_2 = Viking.create()
viking.get_info
viking_2.get_info
winner = nil

loop do
  viking.take_damage(viking_2)
  if viking_2.is_dead
    winner = viking
    break
  end
  viking_2.take_damage(viking)
  if viking.is_dead
    winner = viking_2
    break
  end
end

puts "Winner is #{winner.name}"
