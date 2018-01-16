arr = [ 
	[1, 5, 9, 13], 
	[2, 6, 0, 14], 
	[3, 7, 11, 15], 
	[4, 8, 12, 16]
]

  

def print_mat(arr)
  arr.each do |row|
    row.each do |col_item|
      print "#{col_item}, "
    end
    puts ''
  end
end

def print_rotate_90(arr)
  row = 0
  while row < arr.length
    col = arr.length - 1
    while col > -1
      print "#{arr[col][row]}, "
      col -= 1
    end
    puts ''
    row += 1
  end
end

print_rotate_90(arr)
