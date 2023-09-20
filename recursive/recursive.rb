def countdown_recursive(i)
  if i <= 0
    puts 'Hooray!'
    return
  end

  puts i
  countdown_recursive(i - 1)
end

countdown_recursive(3)
puts

def sum_range(n)
  total = 0
  i = n
  while i.positive?
    total += i
    i -= 1
  end

  total
end

def sum_range_recursive(n)
  return n if n <= 0

  n + sum_range_recursive(n - 1)
end

def sum_range_recursive2(n, total)
  return total if n <= 0

  sum_range_recursive2(n - 1, total + n)
end

puts sum_range(5)
puts sum_range_recursive(5)
puts sum_range_recursive2(5, 0)

puts

tree = {
  name: 'John',
  children: [
    {
      name: 'Jim',
      children: []
    },
    {
      name: 'Zoe',
      children: [
        { name: 'Kyle', children: [] },
        { name: 'Sophia', children: [] }
      ]
    }
  ]
}

def print_children(t)
  return if t[:children].empty?

  t[:children].each do |n|
    puts n[:name]
    print_children(n)
  end
end

print_children(tree)
puts

def factorial(n)
  return n if n <= 1

  n * factorial(n - 1)
end

puts factorial(5)
puts

def bottles_on_the_wall(bottles)
  if bottles <= 0
    puts 'no more bottles of beer on the wall'
    return
  end

  puts "#{bottles} bottles of beer on the wall"
  bottles_on_the_wall(bottles - 1)
end

bottles_on_the_wall(10)
puts

def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  fib(n - 1) + fib(n - 2)
end

puts fib(9)
puts

def palindrom?(w)
  return true if w.length < 2

  w[0] == w[-1] && palindrom?(w[1..(w.length - 2)])
end

p palindrom?('')
