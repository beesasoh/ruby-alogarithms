def reverse(str)
  return str if str.size <= 1
  reverse(str[1..(str.size - 1)]) + str[0]
end

puts reverse('bisaso')
