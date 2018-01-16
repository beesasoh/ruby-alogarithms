def process_string(str)
  str = str.split('')
  until str.empty?

    str.each_with_index do |char, index|
      next_char = str[index + 1]
      if next_char
        if next_char == char
          2.times { str.delete_at(index) }
          break
        end
      else
        return str.join
      end
    end

  end
  ''
end

puts process_string('aabbaab')
