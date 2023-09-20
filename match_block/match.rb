grade = 'C'

result = case grade
         in 'A' then 1
         in 'B' then 2
         in 'C' then 3
         in 'D' then 4
         else 0
         end

puts result

input = false

case input
in String then puts "input was of type String"
in Integer then puts "input was of type Integer"
in Array then puts "input was of type Array"
in TrueClass then puts "input was of type Boolean (TrueClass)"
in FalseClass then puts "input was of type Boolean (FalseClass)"
end

# Variables pattern

age = 15

case age
in a
  puts a
end

a = 7
case 2
in a
  a
# in b
#   b
end

# puts "a: #{a}, b: #{b}"
puts "a: #{a}"

# c = 5
# case 1
# in ^c
#   :no_match
# end
# puts "c: #{c}"

# As pattern match

case 3
in 3 => d
  puts d
end

# Alternative pattern match

case 1
# case 7
in 0 | 1 | 2
  puts :match
else
  puts :no_match
end

# Guard conditions

some_value = true

case 0
in 0 if some_value
  puts :match
end

# Array pattern match

arr = [1, 2]

case arr
in [1, 2] then puts :match
in [3, 4] then puts :no_match
end

case arr
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

arr = [1, 2, 3]

case arr
in [Integer, Integer]
  puts :no_match
else
  puts :match
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, Integer, Integer]
  puts :match
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, 9, 10]
  puts :match
end

arr = [1, 2, 3, 4]

case arr
in [1, 2, *tail]
  p tail
end

arr = [1, 2, 3, 4]

case arr
in [_, _, 3, 4]
  puts :match
end

arr = [1, 2]
case arr
in [a, b] unless a == b
  puts :match
end

arr = [1, 2, [3, 4]]

case arr
in [_, _, [3, 4]]
  puts :match
end

arr = [1, 2, 3, 4, 5]

case arr
in [1, 2, 3, a, b]
  puts a
  puts b
end

case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  puts a
  p arr
end

# arr = [1, 2, 3]

# case [1, 2, 4]
# in arr
#   :match
# end

# p arr

arr = [1, 2, 3, 4]

case arr
in 1, 2, 3, 4
  puts :match
end


# Hash pattern matching

case { a: 'apple', b: 'banana' }
in { a: 'aardvark', b: 'bat'}
  puts :no_match
in { a: 'apple', b: 'banana'}
  puts :match
end

case { a: 'apple', b: 'banana' }
in { a: a, b: b }
  puts a
  puts b
end

case { a: 'apple', b: 'banana' }
in { a:, b: }
  puts a
  puts b
end

case { a: 'apple', b: 'banana' }
in a:, b:
  puts a
  puts b
end

case { a: 'ant', b: 'ball', c: 'cat' }
in { a: 'ant', **rest }
  p rest
end

case { a: 'ant', b: 'ball' }
in { a: 'ant' }
  puts 'this will match'
in { a: 'ant', b: 'ball' }
  puts 'this will never be reached'
end

case { a: 'ant', b: 'ball' }
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end

case { a: 'ant', b: 'ball' }
in { a: 'ant' } => hash
  p hash
end

# Ruby 3 patterns

login = { username: 'hornby', password: 'iliketrains' }

login => { username: user }
login => { password: pass }

puts "Logged in with username #{user} and password #{pass}"

case [1, 2, 3]
in [*pre, 1, 2, 3, *post]
  p pre
  p post
end

case [0, 1, 2, 3, 4]
in [*pre, 1, 2, 3, *post]
  p pre
  p post
end

case [1, 2, "a", 4, "b", "c", 7, 8, 9]
in [*pre, String => x, String => z, *post]
  p pre
  p x
  p z
  p post
end

case [1, 2, "a", 4, "b", "c", 7, 8, 9]
in [*pre, String => a, Integer => b, String => c, *post]
  p pre
  p a
  p b
  p c
  p post
end

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person[:job_title] = job_title
end

p match&.fetch(:first_language)

case data
in [*, { name: ^name, age: ^age, first_language: first_language, job_title: ^job_title}, *]
else
  first_language = nil
end

p first_language

case data
in [*, { name: 'Bob', first_language: first_language }, *]
else
  first_language = nil
end

p first_language
