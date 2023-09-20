# frozen_string_literal: true

# all string messages
module Display
  def display_intro
    "guess my colors\n#{display_help}"
  end

  def display_help
    <<~RULES
      colors:
        R - red, B - blue
        Y - yellow, G - green
        W - white, O - orange
      colors are case insensitive (so you can you B or b)

      commands:
        - exit - quit program
        - help - show help
    RULES
  end

  def display_game_over
    'game over'
  end

  def display_prompt
    'enter sequence of 4 colors:'
  end

  def display_validation_error
    'input is invalid; try again; enter `help` if you stuck'
  end

  def display_score res
    "black: #{res[:black]} - white: #{res[:white]}"
  end

  def display_win(moves_count)
    <<~WIN
      you win in #{moves_count} #{moves_count == 1 ? 'move' : 'moves'}
      gratulations!!! :D
    WIN
  end

  def display_select_difficulty
    <<~DIFFICULTY
      choose difficulty level (enter "exit" for quit):
      1) easy (just unique pegs)
      2) hard (pegs can be duplicated)
    DIFFICULTY
  end
end
