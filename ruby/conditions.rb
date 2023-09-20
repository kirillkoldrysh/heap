print "Enter x: "
x = gets.chomp
print "Enter y: "
y = gets.chomp

if x == y
    puts "x = y"
elsif x > y
    puts "x > y"
else
    puts "x < y"
end

# puts "x < y" if x < y
# puts "x > y" if x > y
# puts "x = y" if x == y

# if x < y
#     puts "x < y"
# end

unless 4.eql?(4.0)
    puts "4.eql?(4.0) is false"
end

print "Enter your grade (A, B, C, D, F, E): "
grade = gets.chomp
did_i_pass = case grade
    when 'A', 'B', 'C' then "Hell yeah"
    when 'D' then "Don't tell your mother!"
    else "YOU SHALL NOT PASS"
end
puts did_i_pass