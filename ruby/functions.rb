def my_name
  "Joe Smith"
end

def greet(name = "Unknown")
  "Hello, " + name + "!"
end

def even_odd(number)
  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

def my_name_2
  return "Alex"
  "Bob"
end

def even_odd_with_check(number)
  unless number.is_a? Numeric
    return "A number was not entered"
  end

  even_odd(number)
end
