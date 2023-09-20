# frozen_string_literal: true

require 'yaml'
require 'json'
require 'msgpack'

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_yaml
    YAML.dump(
      {
        name: @name,
        age: @age,
        gender: @gender
      }
    )
  end

  def self.from_yaml(string)
    data = YAML.load string
    p data
    new(data[:name], data[:age], data[:gender])
  end

  def to_json
    JSON.dump(
      {
        name: @name,
        age: @age,
        gender: @gender
      }
    )
  end

  def self.from_json(string)
    data = JSON.load string
    puts data
    new(data[:name], data[:age], data[:gender])
  end

  def to_message_pack
    {
      name: @name,
      age: @age,
      gender: @gender
    }.to_msgpack
  end

  def self.from_messagepack(string)
    data = MessagePack.unpack string
    p data
    new(data['name'], data['age'], data['gender'])
  end
end
