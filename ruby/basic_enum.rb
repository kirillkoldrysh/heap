def invite_to_party
  friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
  invited_list = []

  for friend in friends do
    if friend != 'Brian'
    invited_list.push(friend)
    end
  end

  invited_list
end

def invite_to_party_2
  friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
  # friends.select { |friend| friend != 'Brian' }
  friends.reject { |friend| friend == 'Brian' }
end

def greetings
  friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
  friends.each { |friend| puts "Hello, " + friend }
end

def hashmaps
  dict = { :one => 1, :two => 2 }
  dict.each { |key, value| puts "#{key} is #{value}" }
end

def hashmaps_pair
  dict = { :one => 1, :two => 2 }
  dict.each { |pair| puts "the pair is #{pair} "}
end

def arr_index
  arr = ["Banana", "Apple", "Strawberry", "Coconut"]
  arr.each_with_index { |fruit, index| puts fruit if index.even? }
end

def shouting
  friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

  friends.map { |friend| friend.upcase }
end

def votes
  votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
