# Implementation of a stack
class MyQueue
  def initialize
    @store = []
  end

  def push(num)
    @store << num
  end

  def pop
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end
end
