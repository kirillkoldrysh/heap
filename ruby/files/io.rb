# frozen_string_literal: true

def show_lorem_content
  fd = IO.sysopen './lorem.txt'
  file = IO.new(fd)
  puts file.gets until file.eof?
end

def run
  show_lorem_content
  puts 'Again? y/N'
  answer = gets.chomp
  run if %w[y Y].include?(answer)
end

run
