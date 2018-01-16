# Implementation of a stack
class Stack
  def initialize
    @store = []
  end

  def push(num)
    @store << num
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end
end
