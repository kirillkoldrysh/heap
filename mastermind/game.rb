# frozen_string_literal: true

require './display'

# class that has all game
class Game
  include Display

  DIFFICULTY_EASY = '1'
  DIFFICULTY_HARD = '2'
  COMMAND_EXIT = 'exit'
  COMMAND_HELP = 'help'
  CHEAT_SHOW = 'show'
  COLORS = %w[r b y g o w].freeze

  def initialize
    @moves = 0
    @secret_pegs = random_colors_unique
  end

  def play
    puts display_intro

    catch :exit do
      loop do
        input = prompt_difficulty

        case input
        when DIFFICULTY_EASY
          @secret_pegs = random_colors_unique
          break
        when DIFFICULTY_HARD
          @secret_pegs = random_colors
          break
        when COMMAND_EXIT
          throw :exit
        else
          next
        end
      end

      loop do
        input = prompt

        case input
        when COMMAND_EXIT
          throw :exit
        when COMMAND_HELP
          puts display_help
          next
        when CHEAT_SHOW
          puts @secret_pegs.join(' ')
          next
        end

        unless valid?(input)
          puts display_validation_error
          next
        end

        @moves += 1
        score = analyze(input.split(''))
        puts display_score(score)
        if score[:black] == 4
          puts display_win @moves
          break
        end
      end
    end
    puts display_game_over
  end

  def prompt_difficulty
    puts "\n#{display_select_difficulty}"
    gets.chomp
  end

  def prompt
    puts "\n#{display_prompt}"
    gets.chomp.downcase
  end

  def valid?(input)
    return false unless input.length == 4

    return false unless input.match(/^[rbygwo]+$/)

    true
  end

  def random_colors
    Array.new(4) { COLORS.sample }
  end

  def random_colors_unique
    colors = []

    until colors.length == 4
      color = COLORS.sample
      colors.push(color) unless colors.include?(color)
    end

    colors
  end

  def analyze(pegs)
    raise 'argument may be an array' unless pegs.is_a?(Array)

    result = { black: 0, white: 0 }
    pegs.each_with_index do |peg, index|
      if peg == @secret_pegs[index]
        result[:black] += 1
      elsif @secret_pegs.include? peg
        result[:white] += 1
      end
    end

    result
  end
end
