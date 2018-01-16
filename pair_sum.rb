require 'Set'

def sum_to_n?(arr, n)
  return false if arr.size < 2

  set = Set.new

  arr.each do |element|
    return true if set.include? element

    compliment = n - element
    set.add(compliment)
  end

  false
end

puts sum_to_n?([2,3,4,5,6,1,3], 6)
