i = 0

# infinity loop
# loop do
#     puts "i is #{i}"
#     i += 1
#     break if i == 10
# end

while i < 10 do
    puts "i is #{i}"
    i += 1
end

question = "Are you crazy? (Yes|no)"
puts question
# while gets.chomp != "yes" do
#     puts question
# end
until (a = gets.chomp) == "yes" || a == "" do
    puts question
end

for i in 0..5
    puts "#{i} zombies incoming!"
end

5.times do
    puts "Hello world"
end
