def bubble_sort(arr)
  return if arr.length.zero?

  sorted = false

  until sorted
    sorted = true

    arr.each_with_index do |item, index|
      next_item = arr[index + 1]
      next unless next_item

      if item > next_item
        swap(arr, index, index + 1)
        sorted = false
      end
    end

  end
  arr
end

def swap(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

p bubble_sort([5, 3, 1, 13, 23, 56, 12, 12, 2])

# arr = [1,2,3,4]
# p swap(arr, 2,3)
# p arr
