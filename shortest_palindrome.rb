def shortest(word)
  reversed_word = word.reverse
  suffix = get_suffix(word)
  min_prefix = reversed_word[0..(reversed_word.length - 1 - suffix.length)]
  puts min_prefix

  min_prefix + word
end

def get_suffix(word)
  reversed_word = word.reverse
  index = word.length - 2
  index_r = 1

  while index > -1
    prefix_word = word[0..index]
    suffix_reverse = reversed_word[index_r..reversed_word.length]
    return prefix_word if prefix_word == suffix_reverse
    index -= 1
    index_r += 1
  end
  ''
end

puts shortest('bisaso')

# abcd dcba
