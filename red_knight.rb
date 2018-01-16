def printShortestPath(n, i_start, j_start, i_end, j_end)
  queue = [PointState.new(i_start, j_start, 0, '')]

  visted_map = {}

  until queue.empty?

    queue.each do |p|
      i = p.i
      j = p.j

      next if i > n || j > n || i < 0 || j < 0
      next if visted_map.key?("#{i}_#{j}")

      if i == i_end && j == j_end
        puts p.count
        puts p.steps.strip
        return
      end

      count = p.count + 1
      steps = p.steps

      queue += [PointState.new(i - 2, j - 1, count, steps + 'UL '),
                PointState.new(i - 2, j + 1, count, steps + 'UR '),
                PointState.new(i, j + 2, count, steps + 'R '),
                PointState.new(i + 2, j + 1, count, steps + 'LR '),
                PointState.new(i + 2, j - 1, count, steps + 'LL '),
                PointState.new(i, j - 2, count, steps + 'L ')]

      visted_map["#{i}_#{j}"] = true
    end

    queue.shift
  end

  puts 'Impossible'
end

class PointState
  attr_accessor :i, :j, :count, :steps

  def initialize(i, j, count, steps)
    @i = i
    @j = j
    @count = count
    @steps = steps
  end
end

 printShortestPath(7, 0, 3, 4, 3)
# printShortestPath(6, 5, 1, 0, 5)
# printShortestPath(7, 6, 6, 0, 1)
