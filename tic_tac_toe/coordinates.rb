# frozen_string_literal: true

# Class for store coordinates
class Coordinates
  attr_reader :x, :y

  def initialize(coord_x, coord_y)
    @x = coord_x
    @y = coord_y
  end
end
