def ceasar(str, n)
    alphabet = ('a'..'z').to_a
    if alphabet.length < n
        n = n % alphabet.length
    end
    splited = str.split('').map do |s|
        to_upper = s.downcase != s

        index = alphabet.index(s.downcase)
        next s if index == nil
        
        newIndex = index + n
        if newIndex >= alphabet.length
            newIndex = newIndex - alphabet.length
        end
        s = to_upper ? alphabet[newIndex].upcase : alphabet[newIndex]
    end
    splited.join('')
end

puts ceasar('Hello World', 1)