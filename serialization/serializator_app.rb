# frozen_string_literal: true

require 'yaml'
require 'json'
require 'msgpack'
require './person'
require './animal'
require './team'
require './fighter'

class SerializatorApp
  def run
    # read_yaml
    # person_to_yaml
    # person_from_yaml
    # read_json
    # person_to_json
    # person_from_json
    # test_msgpack
    # person_to_msgpack
    # person_from_msgpack
    # serialize_animal
    # save_serialized_animal
    # read_serialized_animal
    serialize_team
  end

  def read_yaml
    test = YAML.load File.read('data/test.yaml')
    puts test['name']
    puts test['age']
  end

  def person_to_yaml
    p = Person.new 'James', 28, 'male'
    puts p.to_yaml
    File.write('data/james.yaml', p.to_yaml)
  end

  def person_from_yaml
    p Person.from_yaml File.read('data/james.yaml')
    puts p
  end

  def read_json
    json = JSON.load File.read('data/test.json')
    puts "Name: #{json['name']}"
    puts "Age: #{json['age']}"
    puts "Hobbies: #{json['hobbies'].join(', ')}"
  end

  def person_to_json
    p = Person.new 'Jessie', 31, 'female'
    puts p.to_json
    File.write('data/jessie.json', p.to_json)
  end

  def person_from_json
    p = Person.from_json File.read('data/jessie.json')
    puts p
  end

  def test_msgpack
    msg = { width: 25, height: 34, color: 'white' }.to_msgpack

    p msg
    File.write('data/test.msgpack', msg)
    obj = MessagePack.unpack File.read('data/test.msgpack')
    p obj['width']
  end

  def person_to_msgpack
    p = Person.new 'John', 77, 'male'
    File.write('data/john.msgpack', p.to_message_pack)
  end

  def person_from_msgpack
    p = Person.from_messagepack File.read('data/john.msgpack')
    puts "Name: #{p.name}\nAge: #{p.age}"
  end

  def serialize_animal
    a = Animal.new 'Scooby', 3, 'dog'
    p a.serialize
  end

  def save_serialized_animal
    a = Animal.new 'Lessy', 5, 'dog'
    File.write('data/lessy.json', a.serialize)
  end

  def read_serialized_animal
    a = Animal.new '', 0, ''
    a.unserialize File.read('data/lessy.json')
    puts a
    p a.name
    p a.age
    p a.type
  end

  def serialize_team
    t = Team.new
    t.add Fighter.new('Kitana', 'knifes')
    t.add Fighter.new('Sonya', 'purple fireball')
    t.add Fighter.new('Jax', 'steel fist')
    t.add Fighter.new('Kung Lao', 'sharp flyying hat')

    puts t.serialize
  end
end

app = SerializatorApp.new
app.run
