@memo = {}

@blocks = [
  [1, 0], [1, 1], [1, 2]
]

def paths(matrix_size, row, col)
  key = "#{row}_#{col}"

  return @memo[key] if @memo.key?(key)
  return 1 if row == matrix_size - 1
  return 1 if col == matrix_size - 1

  @memo[key] = paths(matrix_size, row + 1, col) +
               paths(matrix_size, row, col + 1)
end

def path2(matrix_size, row, col)
  key = "#{row}_#{col}"

  return @memo[key] if @memo.key? key

  return 0 if row < 0 || col < 0 || row > matrix_size || col > matrix_size
  return 0 if block?(row, col)

  return 1 if row == matrix_size - 1 && col == matrix_size - 1

  @memo[key] = path2(matrix_size, row + 1, col) +
               path2(matrix_size, row, col + 1)
               # path2(matrix_size, row+1, col + 1)
end

def block?(row, col)
  @blocks.include?([row, col])
end

puts path2(4, 0, 0)
puts @memo
puts "Memo size: #{@memo.size}"
