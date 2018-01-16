def read_reverse(word)
  len = word.length
  last_index = len - 1

  current_index = last_index
  while current_index > -1
    puts word[current_index]
    current_index -= 1
  end
end

read_reverse('bisaso')
