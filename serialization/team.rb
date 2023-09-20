# frozen_string_literal: true

require './basic_serializable'

class Team
  include BasicSerializable

  attr_accessor :fighters

  def initialize
    @fighters = []
  end

  def add(fighter)
    @fighters.push fighter
  end

  def serialize
    obj = @fighters.map do |fighter|
      fighter.serialize
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse string
    @fighters = []
    obj.each do |fighter_string|
      fighter = Fighter.new '', ''
      fighter.unserialize(fighter_string)
      @fighters << fighter
    end
  end

  def <<(fighter)
    @fighters << fighter
  end
end
