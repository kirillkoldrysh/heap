module Display
  def display_intro
    'Hangman Game: guess the word'
  end

  def display_prompt
    'enter a letter'
  end

  def display_game_over_win(word)
    "you win! word is '#{word}' gratulations!"
  end

  def display_game_over_lose(secret_word)
    "you lose! the word was '#{secret_word}'\ntry again next time"
  end

  def display_hangman(errors)
    case errors
    when 0
      <<-HMAN
          |
          |
          |
          |
          |
      HMAN
    when 1
      <<-HMAN
      _____
          |
          |
          |
          |
          |
      HMAN
    when 2
      <<-HMAN
      _____
       |  |
       O  |
          |
          |
          |
      HMAN
    when 3
      <<-HMAN
      _____
       |  |
       O  |
       |  |
          |
          |
      HMAN
    when 4
      <<-HMAN
      _____
       |  |
       O  |
       |\\ |
          |
          |
      HMAN
    when 5
      <<-HMAN
      _____
       |  |
       O  |
      /|\\ |
          |
          |
      HMAN
    when 6
      <<-HMAN
      _____
       |  |
       O  |
      /|\\ |
        \\ |
          |
      HMAN
    when 7
      <<-HMAN
      _____
       |  |
       O  |
      /|\\ |
      / \\ |
          |
      HMAN
    end
  end
end
