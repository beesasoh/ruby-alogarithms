class TreeNode
  attr_accessor :data, :left, :right

  def initialize(data)
    @data  = data
    @left  = nil
    @right = nil
  end

  def insert(value)
    if value > @data
      if @right.nil?
        @right = TreeNode.new(value)
      else
        @right.insert(value)
      end
    else
      if @left.nil?
        @left = TreeNode.new(value)
      else
        @left.insert(value)
      end
    end
  end

  def contains?(value)
    return true if value == @data
    if value > @data
      if @right.nil?
        return false
      else
        @right.contains?(value)
      end
    else
      if @left.nil?
        return false
      else
        @left.contains?(value)
      end
    end
  end

  def print_in_order
    print "#{@left.print_in_order}, " if @left
    print "#{@data}, "
    print "#{@right.print_in_order}, " if @right
  end

  def min_depth
    return 1 if leaf_node

    left_depth  = @left.nil?  ? Float::INFINITY : @left.min_depth
    right_depth = @right.nil? ? Float::INFINITY : @right.min_depth

    1 + [left_depth, right_depth].min
  end

  def leaf_node
    @leaf.nil? && @right.nil?
  end

  def check_balanced?(min, max)
    return false if @data < min || @data > max

    left_balanced = if @left
                      @left.check_balanced?(min, @data - 1)
                    else
                      true
                    end

    right_balanced = if @right
                       @right.check_balanced?(@data + 1, max)
                     else
                       true
                     end

    left_balanced && right_balanced
  end


  def lca(root, node_1, node_2)
    return nil unless root

    if root == node_1 || root == node_2
      return root
    end

    left  = lca(root.left, node_1, node_2)
    right = lca(root.left, node_1, node_2)

    if left && right
      return root
    end

    return left if left
    return right if right
  end
end

t = TreeNode.new(100)
t.insert(50)
t.insert(150)
t.insert(140)
t.insert(120)
t.insert(170)
t.insert(15)
t.insert(25)
t.print_in_order
puts ''
puts t.check_balanced?(0, Float::INFINITY)

