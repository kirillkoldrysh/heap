# frozen_string_literal: true

require './basic_serializable'

class Fighter
  include BasicSerializable

  attr_accessor :name, :power

  def initialize(name, power)
    @name = name
    @power = power
  end
end
