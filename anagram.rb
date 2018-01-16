def anagram(str1, str2)
  return false if str1.length != str2.length
  analyse(str1) == analyse(str2)
end

def analyse(str)
  character_map = Hash.new(0)
  str.split('').each do |char|
    character_map[char] += 1
  end
  character_map
end

def number_to_create_anagram(word1, word2)
  char_count_word1 = get_char_counts(word1)
  char_count_word2 = get_char_counts(word2)
  compute_difference(char_count_word1, char_count_word2)
end

def get_char_counts(str)
  arr = Array.new(26, 0)
  str.downcase.each_char do |c|
    index = c.ord - 'a'.ord
    arr[index] += 1
  end
  arr
end

def compute_difference(count_word1, count_word2)
  char_difference = 0
  count_word1.each_with_index do |value, index|
    char_difference += (value - count_word2[index]).abs
  end
  char_difference
end

puts number_to_create_anagram('glue', 'legs')
