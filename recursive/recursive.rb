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

p palindrom?('abba')
puts


[
  [
    1,
    2,
  ],
  [
    3,
    4,
  ]
]

def unpack_array(arr, res)
  arr.each do |a|
    if a.is_a?(Array)
      unpack_array(a, res)
    else
      res.push(a)
    end
  end

  res
end

p unpack_array([[[[-1, 0], 1], 2], [3, [4, 5], [6, 7]]], [])
puts

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0

  roman_mapping.each_key do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

p integer_to_roman(roman_mapping, 2)

roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}
def roman_to_integer(roman_mapping, str, result = 0)
  return result if str.empty?
  roman_mapping.each_key do |roman|
    if str.start_with?(roman)
      result += roman_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_integer(roman_mapping, str, result)
    end
  end
end

p roman_to_integer(roman_mapping, 'MCXI')
