require './lib/my_enumerables'

a = [1, 1, 2, 3, 5, 8, 13, 21]

p(a.inject { |sum, n| sum + n })
res = a.inject do |sum, n|
  sum + n
end
p res
p(a.my_inject { |sum, n| sum + n })
