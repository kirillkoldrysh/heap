# frozen_string_literal: true

module Display
  def display_intro
    "let's play Bulls and Cows; guess what number I made up for you"
  end

  def display_number_prompt
    'enter a number'
  end

  def display_game_over
    'game over'
  end

  def display_invalid_input
    'invalid input; enter 4 digit number'
  end

  def display_win_message(moves)
    "you win in #{moves} moves, well done!"
  end

  def display_score(score)
    "you have #{score[:cows]} cows and #{score[:bulls]} bulls"
  end
end