require './display'

class Game
  include Display

  def initialize
    @secret_word = 'programming'
    @letters = []
    @errors = 0
    @max_errors = 7
  end

  def run
    puts display_intro

    loop do
      puts display_hangman(@errors)
      puts "#{user_word(display: true)}\n"
      puts display_prompt
      letter = gets.chomp
      break if letter == 'exit'

      if @secret_word.include?(letter)
        @letters.push(letter)
      else
        @errors += 1
      end

      if (@errors == @max_errors)
        puts "#{display_hangman(@errors)}\n"
        puts display_game_over_lose(@secret_word)
        break
      end

      if user_word.length == @secret_word.length
        puts user_word(display: true)
        puts display_game_over_win(@secret_word)
        break
      end
    end
  end

  def user_word(display: false)
    filler = display ? '_' : ''
    res = @secret_word.split('')

    res.each_with_index do |l, i|
      res[i] = filler unless @letters.include?(l)
    end

    return res.join(' ') if display

    res.join('')
  end
end
