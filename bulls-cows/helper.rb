# frozen_string_literal: true

module Helper
  def numeric?(string)
    true if Float(string) rescue false
  end

  def new_random_number
    number = ''
    loop do
      n = (rand * 10).floor.to_s
      break if number.length == 4

      number += n unless number.include? n
    end

    number
  end
end
