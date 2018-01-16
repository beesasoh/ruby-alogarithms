def get_list(list)
  results = []

  until list.empty?
    word_anagrams = []
    current_word = list.first

    list.each do |word|
      next if word == current_word
      word_anagrams << word if anagram?(word, current_word)
    end

    word_anagrams << current_word
    word_anagrams.each do |anagram|
      list.delete(anagram)
    end

    results << word_anagrams.sort
  end

  results.sort_by { |element| element[0] }
end

def anagram?(word1, word2)
  word1 = word1.delete(' ').split('')
  word2 = word2.delete(' ').split('')
  word1.sort == word2.sort
end

def get_list2(list)
  anagram_map = Hash.new('')

  list.each_with_index do |word, index|
    word = sort_word(word)
    anagram_map[word] += "#{index} "
  end

  anagram_results = []
  anagram_map.each do |_key, value|
    sub_anagrams = []
    value.split(' ').each do |index|
      sub_anagrams << list[index.to_i]
    end
    anagram_results << sub_anagrams.sort
  end

  anagram_results.sort_by { |element| element[0] }
end

def sort_word(word)
  word.delete(' ').split('').sort.join
end

arr = ['pear', 'amleth', 'dormitory', 'tinsel',
       'dirty room', 'hamlet', 'listen', 'silnet']


results = get_list2(arr)
results.each do |i|
	puts i.join(', ')
end
