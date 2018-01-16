def next_greater_element(arr)
  index = arr.length - 1
  current_max = nil

  while index > -1

    if current_max.nil?
      current_max = arr[index]
      puts "Next greater item for #{current_max} is null"
    elsif current_max > arr[index]
      puts "Next greater item for #{arr[index]} is #{current_max}"
    elsif arr[index] > current_max
      puts "Next greater item for #{arr[index]} is null"
      current_max = arr[index]
    end

    index -= 1
  end
end

next_greater_element([98, 23, 45, 12, 20, 7, 27])
