def unique_characters?(word)
  return false unless word.is_a? String

  word = word.strip
  i = 0
  memo_array = []

  while i < word.length
    return false if memo_array.include?(word[i].downcase)
    memo_array.push(word[i].downcase)
    i += 1
  end

  true
end
