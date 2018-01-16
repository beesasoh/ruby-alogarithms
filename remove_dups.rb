def remove_dups(word)
  return false unless word.is_a? String

  word = word.strip
  i = 0
  memo_array = []
  final_string = ''

  while i < word.length
    unless memo_array.include?(word[i])
      final_string << word[i]
      memo_array.push(word[i].downcase)
    end
    i += 1
  end

  final_string
end
