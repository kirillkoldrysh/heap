loop do
  puts "Enter a number >>"
  begin
    num = Kernel.gets.match(/\d+/)[0]
  rescue
    puts "Input is invalid. Try again..."
  else
    puts "#{num} + 1 is #{num.to_i + 1}"
  end
end