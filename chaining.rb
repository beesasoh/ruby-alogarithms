def chain2(arr)
  head = Node.new(get_head(arr))
  return unless head

  current = head
  tail = current

  while current
    current = find_next(tail.data, arr)
    tail.next = current
    tail = current
  end

  print_results(head)
end

def create_last_chars_map(arr)
  chars_map = {}
  arr.each do |word|
    chars_map[word[-1].downcase] = word
  end
  chars_map
end

def create_first_chars_map(arr)
  chars_map = {}
  arr.each do |word|
    chars_map[word[0].downcase] = word
  end
  chars_map
end

def print_results(head)
  current = head

  while current
    puts current.data
    current = current.next
  end
end

def get_head(arr)
  last_chars_map = create_last_chars_map(arr)
  arr.each do |word|
    first_char = word[0].downcase
    return word unless last_chars_map.key? first_char
  end
  puts 'Circular list'
  nil
end

def find_next(word, arr)
  return nil unless word
  first_chars_map = create_first_chars_map(arr)
  last_char = word[-1].downcase
  next_word = first_chars_map[last_char]
  return Node.new(next_word) if next_word
  nil
end

# Node to support linked list
class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

p chain2(%w[Raymond Nora Daniel Louie Peter Esteban])
