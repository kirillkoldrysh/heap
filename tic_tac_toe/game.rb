# frozen_string_literal: true

require './coordinates'
require './game_field'

game_field = GameField.new

puts 'Welcome to Tic-Tac-Toe!'
loop do
  game_field.show
  puts 'X: Enter coordinates separated by comma ("x,y" format) or "exit" for exit the game'

  player_x = gets.chomp
  break if player_x == 'exit'

  coords = player_x.split(',')
  game_field.set_field(Coordinates.new(coords[0].to_i, coords[1].to_i), GameField::CROSS)

  game_field.show
  puts 'O: Enter coordinates separated by comma ("x,y" format) or "exit" for exit the game'

  player_o = gets.chomp
  break if player_o == 'exit'

  coords = player_o.split(',')
  game_field.set_field(Coordinates.new(coords[0].to_i, coords[1].to_i), GameField::NOUGHT)
end
