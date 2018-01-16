def next_higher_number(number)
  digits_array = number.to_s.split('')
  index = digits_array.length - 1
  postion_unsorted = nil

  while index > 0
    current = digits_array[index]
    prev = digits_array[index - 1]
    if current > prev
      postion_unsorted = index - 1
      break
    end
    index -= 1
  end

  return 'None' unless postion_unsorted

  index = digits_array.length - 1

  while index > 0
    current = digits_array[index]
    if current > digits_array[postion_unsorted]
      digits_array[postion_unsorted], digits_array[index] = 
         digits_array[index], digits_array[postion_unsorted]
      break
    end
    index -= 1
  end
  
  final_array = digits_array.take(postion_unsorted + 1) + 
                digits_array.drop(postion_unsorted + 1).sort

  final_array.join.to_i
end

p next_higher_number(328341)

# 32841

# 01234

# get_replacement_number()
# sort()
