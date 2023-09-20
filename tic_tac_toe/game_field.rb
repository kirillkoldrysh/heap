# frozen_string_literal: true

# All logic around game field
class GameField
  EMPTY = ' '
  CROSS = 'X'
  NOUGHT = 'O'

  def initialize
    @game_field = [
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY]
    ]
  end

  def show
    @game_field.each do |row|
      puts row.join(' | ')
    end

    puts
  end

  def set_field(coords, value)
    raise 'Expected Coordinates class' unless coords.is_a?(Coordinates)
    raise 'Expected x coordinate must be in range 0 to 2' unless (0..2).include?(coords.x)
    raise 'Expected y coordinate must be in range 0 to 2' unless (0..2).include?(coords.y)

    @game_field[coords.y][coords.x] = value
  end
end
