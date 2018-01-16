@str = 'We have have a we in the a digested server log with username,
    visited page and timestamp.
    Create a processing algorithm that will output the most visited
    page/areas in such a way that will match partial path as well.
    Dynamic programming question about coin change,
    expected result was minimum number of coins with the coin types.
    We have two words. We need to determine if the second word contains
    a substring with an anagram of the first word. A robot moving,
    how do you know if it visited that same point before'

def tokenise
  map = Hash.new(0)
  @str.split(' ').each do |word|
    word = word.downcase
    map[word] += 1
  end # 0(N)

  #words = Array.new(10, 0)

  return map.keys if map.size <= 10
  puts map.sort_by { |_key, value| value }.last(10).reverse.to_h
end

p tokenise
