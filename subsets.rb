@subsets = []

def print_subsets(set)
  set.each do |element|
    multiply_set(element)
  end
end

def multiply_set(num)
  tmp_set = @subsets.map(&:dup)

  @subsets.each { |el| el << num }

  @subsets << [num]
  @subsets += tmp_set
end

print_subsets([1])
p @subsets


# [1,2,3]
# [ [1] ]
# [ [1], [1,2], [2] ]
# [ [1,3], [1,2,3], [2, 3], [3], [1], [1,2], [2] ]

