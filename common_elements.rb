require 'Set'
def common_elements(arr1, arr2)
  set1 = Set.new(arr1)
  set2 = Set.new(arr2)
  set1.intersection(set2).to_a
end

def common_elements2(arr1, arr2)
  set = Set.new(arr1)
  common = []

  arr2.each { |element| common << element if set.include? element }
  common
end

p common_elements([1, 2, 3], [2, 3, 4, 5])
p common_elements([1, 2, 3], [2, 3, 4, 5])
