def anagram_substring?(word1, word2)

  return false if word1.length > word2.length

  index = 0
  while index < word2.length - word1.length + 1
    substr = word2[index..(index + word1.length)]

    if anagram?(substr, word1)
      return true
    else
      index += 1
    end
  end
  false
end

def anagram?(str1, str2)
  str1.chars.sort.join == str2.chars.sort.join
end

puts anagram_substring?('books', 'mybooks')
