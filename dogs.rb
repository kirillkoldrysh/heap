class GoodDog
    attr_accessor :name, :color, :age
    def initialize(name, color, age)
        @name = name
        @color = color
        @age = age
        puts "A #{color} dog with name #{name} was initialized"
    end

    def bite(dog)
        raise "#{@name} can't bite because given object is not GoodDog" if dog.class.name != 'GoodDog'

        puts "#{@name} bites #{dog.name}"
    end

    def die
        puts "#{@name} dies. R.I.P. :("
    end
end

jack = GoodDog.new('Jack', 'black', 3)
rex = GoodDog.new('Rex', 'white', 7)
pumpkin = GoodDog.new('Pumpkin', 'green', 15)

pumpkin.bite(jack)
rex.bite(pumpkin)
pumpkin.die


