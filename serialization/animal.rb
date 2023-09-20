# frozen_string_literal: true

require './basic_serializable'

class Animal
  include BasicSerializable

  attr_accessor :name, :age, :type

  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end
