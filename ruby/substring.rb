def substrings(str, dict)
  dict_stat = Hash.new(0)

  str.split(' ').each do |w|
    dict.each_with_object(dict_stat) do |word, result|
      result[word] += 1 if w.include? word
    end
  end

  dict_stat
end

# Version by nguyenjessev
def substrings_new(text, dictionary)
  result = Hash.new(0)
  lowered_text = text.downcase

  dictionary.each do |word|
    matches = lowered_text.scan(word).length
    result[word] = matches unless matches == 0
  end

  result
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
