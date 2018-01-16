def swap_to_get_max(num)
  int_array = num.to_s.split('')
  max_element = int_array.sort.last
  leading_number = int_array.first

  if max_element.to_i > leading_number.to_i
    index_of_max = int_array.index(max_element)

    int_array[0], int_array[index_of_max] = max_element, int_array[0]
  end

  int_array.join.to_i
end

puts swap_to_get_max(21811181111)