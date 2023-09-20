food = ["Burger", "Salad", "Burger"]

res = food.reduce(Hash.new(0)) do |result, vote|
    result[vote] += 1
    result
end

puts res
