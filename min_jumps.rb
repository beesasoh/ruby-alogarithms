@memo = {}

def min_jumps(arr)
  len = arr.length

  return @memo[len] if @memo.key? len
  return 0 if len < 2
  return 1 if arr[0] >= (len + 1)
  return Float::INFINITY if arr[0].zero?

  options = []
  i = 0
  while i < arr[0]
    options << min_jumps(arr.drop(i + 1))
    i += 1
  end

  results = 1 + options.min
  @memo[len] = results
  results
end

puts min_jumps([2, 5, 8, 9, 2, 6, 7, 6, 1, 2, 5,4,5,3,4,5,6,7,8,9, 8, 9, 2, 6, 7, 6, 8, 9, 1, 1, 6, 8, 9, 1, 1, 1])
puts @memo