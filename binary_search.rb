def binary_search(arr, num)
  return -1 if arr.empty?

  start_index = 0
  end_index = arr.length - 1

  while start_index <= end_index
    mid = (end_index + start_index) / 2
    mid_element = arr[mid]

    return mid if mid_element == num
      
    if mid_element > num
      end_index = mid - 1
    else
      start_index = mid + 1
    end
  end
  -1
end

puts binary_search((1..100).to_a, 100)
