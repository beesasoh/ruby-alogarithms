def generate_permutations(word)
  permutations = ['']

  word.each_char do |char|
    tmp_set = []

    permutations.each do |permutation|
      tmp_set += insert_in_all_positions(char, permutation)
    end

    permutations = tmp_set
  end
  puts "count: #{permutations.size}"
  permutations
end

def insert_in_all_positions(char, word)
  permutation_sets = []
  len = word.length + 1

  index = 0
  while index < len
    permutation_sets << word.split('').insert(index, char).join
    index += 1
  end
  permutation_sets
end

p generate_permutations('abcdefghi')
