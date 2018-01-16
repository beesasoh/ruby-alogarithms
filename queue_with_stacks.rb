class QueueWithStacks
  def initialize
    @stack_active = Stack.new
    @stack_dup    = Stack.new
  end

  def enqueue(node)
    @stack_active.push(node)
  end

  def dequeue
    if @stack_dup.empty?
      @stack_dup.push(@stack_active.pop) until @stack_active.empty?
    end
    @stack_dup.pop
  end

  def peek
    if @stack_dup.empty?
      @stack_dup.push(@stack_active.pop) until @stack_active.empty?
    end
    @stack_dup.peek
  end

  # Stack implementation
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

    def empty?
      @store.empty?
    end
  end

end
