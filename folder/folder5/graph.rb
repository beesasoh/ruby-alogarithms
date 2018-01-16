def path?(graph, start, target)
  return if graph.nil? || start.nil? || target.nil?

  graph.each do |node|
    node.visited = false
  end

  queue = []
  queue << start

  until queue.empty?
    current_node = queue.first
    return true if current_node == target

    adjacents = current_node.get_adjacent
    adjacents.each do |node|
      queue << node if node.visited == false
    end

    current_node.visited = true
    queue.shift
  end

  false
end
