# tmp_set = @subsets.map(&:dup)

def mountain_count(arr)
  mountains = 0
  check_complete = false

  until check_complete
    check_complete = true
    arr.each_with_index do |row, index_row|
      row.each_with_index do |value, index_col|
        next unless value == 1
        mountains += 1
        check_complete = false
        search_connected(arr, index_row, index_col)
      end
    end
  end  # O(N)
  mountains
end

def biggest_mountain(arr)
  mountains = 0
  check_complete = false

  until check_complete
    check_complete = true
    arr.each_with_index do |row, index_row|
      row.each_with_index do |value, index_col|
        next unless value == 1
        check_complete = false
        count = count_connected(arr, index_row, index_col)
        mountains = [count, mountains].max
      end
    end
  end
  mountains
end

def search_connected(arr, row, col)
  len = arr.length - 1
  return if row < 0 || col < 0 || row > len || col > len

  return if arr[row][col].zero?

  arr[row][col] = 0
  search_connected(arr, row - 1, col - 1)
  search_connected(arr, row - 1, col)
  search_connected(arr, row - 1, col + 1)
  search_connected(arr, row, col - 1)
  search_connected(arr, row, col + 1)
  search_connected(arr, row + 1, col - 1)
  search_connected(arr, row + 1, col)
  search_connected(arr, row + 1, col + 1)
end

def count_connected(arr, row, col)
  len = arr.length - 1
  return 0 if row < 0 || col < 0 || row > len || col > len
  return 0 if arr[row][col].zero?

  arr[row][col] = 0

  1 + count_connected(arr, row - 1, col - 1) +
    count_connected(arr, row - 1, col) +
    count_connected(arr, row - 1, col + 1) +
    count_connected(arr, row, col - 1) +
    count_connected(arr, row, col + 1) +
    count_connected(arr, row + 1, col - 1) +
    count_connected(arr, row + 1, col) +
    count_connected(arr, row + 1, col + 1)
end

arr = [
  [0, 1, 0, 1, 0, 1],
  [1, 0, 1, 0, 1, 1],
  [0, 0, 0, 0, 1, 0],
  [1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 1]
]

#puts mountain_count(arr)
puts biggest_mountain(arr)
