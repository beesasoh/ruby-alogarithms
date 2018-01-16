# class to implement the tree structure
class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def self.create_from(arr)
    return if arr.empty?
    create(arr, 0, arr.length - 1)
  end

  def self.create(arr, start_index, end_index)
    return if start_index > end_index

    mid = (end_index + start_index) / 2
    node = TreeNode.new(arr[mid])

    node.left  = create(arr, start_index, mid - 1)
    node.right = create(arr, mid + 1, end_index)

    node
  end

  def insert(value)
    if @value > value
      insert_left(value)
    else
      insert_right(value)
    end
  end

  def insert_left(value)
    if @left
      @left.insert(value)
    else
      @left = TreeNode.new(value)
    end
  end

  def insert_right(value)
    if @right
      @right.insert(value)
    else
      @right = TreeNode.new(value)
    end
  end

  def find(value)
    return true if @value == value
    if @value > value
      return false if @left.nil?
      @left.find(value)
    else
      return false if @right.nil?
      @right.find(value)
    end
  end

  def print_preorder_order
    @left.print_preorder_order if @left
    print "#{@value}, "
    @right.print_preorder_order if @right
  end

  def print_in_order
    print "#{@value}, "
    @left.print_in_order  if @left
    @right.print_in_order if @right
  end

  def print_post_order
    @left.print_in_order  if @left
    @right.print_in_order if @right
    print "#{@value}, "
  end

  def print_level_order
    queue = []
    queue.push(self)
    until queue.empty?
      current_node = queue.first

      queue.push(current_node.left)  if current_node.left
      queue.push(current_node.right) if current_node.right

      print "#{current_node.value}, "
      queue.shift
    end
  end

  def balanced?
    difference = (left_depth - right_depth).abs
    difference < 2
  end

  def left_depth
    return 0 if @left.nil?
    1 + [@left.left_depth, @left.right_depth].max
  end

  def right_depth
    return 0 if @right.nil?
    1 + [@right.left_depth, @right.right_depth].max
  end
end

tree = TreeNode.create_from([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])

# tree = TreeNode.new(100)
# tree.insert(200)
# tree.insert(250)
# tree.insert(350)
# tree.insert(300)
# tree.insert(290)
# tree.insert(50)
# tree.insert(70)
# tree.insert(90)

# puts "Tree contains 25: #{tree.find(25)}"
# puts "Tree contains 40: #{tree.find(40)}"

tree.print_preorder_order
puts ''
tree.print_in_order
puts ''
tree.print_post_order
puts ''
tree.print_level_order
puts ''

puts "Tree balanced: #{tree.balanced?}"
