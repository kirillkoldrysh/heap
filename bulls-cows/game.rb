# frozen_string_literal: true

require './display'
require './helper'

class Game
  include Display
  include Helper

  attr_accessor :number

  def initialize
    @number = new_random_number
    @moves = 0
  end

  def play
    puts display_intro

    loop do
      puts display_number_prompt
      input = gets.chomp
      break if want_quit?(input)

      unless input_correct?(input)
        puts display_invalid_input
        next
      end

      @moves += 1
      if number_right?(input)
        puts display_win_message(@moves)
        break
      end

      puts display_score(analyze(input))
    end

    puts display_game_over
  end

  def number_right?(number)
    number == @number
  end

  def analyze(number)
    score = { cows: 0, bulls: 0 }
    number.split('').map do |n|
      next unless @number.include? n

      if @number.index(n) == number.index(n)
        score[:bulls] += 1
      else
        score[:cows] += 1
      end
    end

    score
  end

  def want_quit?(input)
    input == 'exit'
  end

  def input_correct?(number)
    return false if number.length != 4

    numeric?(number)
  end
end
