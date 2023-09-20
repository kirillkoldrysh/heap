def encode_ceasar(str, n)
  symbols = ('a'..'z').to_a
  str_exploded = str.split('')

  res = str_exploded.map do |s|
    new_index = symbols.index(s) + n
    if (new_index >= symbols.length)
      new_index = new_index - symbols.length
    end

    symbols[new_index]
  end

  res.join
end

puts encode_ceasar('abz', 1);