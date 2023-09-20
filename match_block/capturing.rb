def cool_method(&my_block)
  my_block.call
end

cool_method { puts 'cool' }
cool_method do
  a = 1 + 1
  puts "a: #{a}"
end

def hot_method(n, &my_block)
  my_block.call(n)
end

arr = ['1', '2', '3', '4', '5.1']

p arr.map(&:to_i)

def another_cool_method
  yield
end

my_proc = proc { puts 'proc party' }
another_cool_method(&my_proc)
