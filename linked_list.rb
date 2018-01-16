# linked list implementation
class LinkedList
  # data
  # next
  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
      return @head
    end

    current = @head
    current = current.next while current.next

    new_tail = Node.new(data)
    current.next = new_tail
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
      return @head
    end

    new_head = Node.new(data)
    new_head.next = @head
    @head = new_head
  end

  def delete_with_value(value)
    return if @head.nil?

    if @head.data == value
      @head = @head.next
      return
    end

    current = @head
    while current.next
      if current.next.data == value
        current.next = current.next.next
        return
      end
      current = current.next
    end
  end

  def print_list
    if @head.nil?
      puts 'List is empty'
    else
      current = @head
      while current
        print "#{current.data} , "
        current = current.next
      end
    end
  end
end

# Nodes of the linked list
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

