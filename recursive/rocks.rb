class Rocks
  def initialize
    @rocks = 30.times.map { |n| rand(200) + 1 }
    puts @rocks.join(', ')
  end

  def heaviest_by_cyclus
    max_rock = 0
    @rocks.each do |rock|
      max_rock = rock if max_rock < rock
    end

    puts "Heaviest rock by cyclus is: #{max_rock}"
  end

  def heaviest_by_inject
    puts "Heaviest rock by inject is: #{@rocks.inject{ |max_rock, rock| max_rock > rock ? max_rock : rock }}"
  end

  def heaviest_by_recursion
    max_rock = rock_judjer(@rocks)

    puts "Heaviest rock by cyclus is: #{max_rock}"
  end

  def rock_judjer(rocks_arr)
    if rocks_arr.length <= 2 # the base case
      a = rocks_arr[-1]
      b = rocks_arr[0]
    else
      a = rock_judjer(rocks_arr.slice!(0, rocks_arr.length / 2))
      b = rock_judjer(rocks_arr)
    end

    a > b ? a : b
  end
end

r = Rocks.new
r.heaviest_by_cyclus
r.heaviest_by_inject
r.heaviest_by_recursion
