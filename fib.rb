
class Fibonaci

  @@map = { 0 => 0, 1 => 1 }

  def self.fib(num)

    return @@map[num] if @@map.key?(num)

    fibvalue = fib(num - 1) + fib(num - 2)
    @@map.store(num, fibvalue)
    fibvalue
  end



  @memo = [0, 1]
  def fib2(num)
    return @memo[num] if @memo[n]

    @memo[num] = fib2(num-1) + fib(num-2) 
  end
end

puts Fibonaci.fib(0)

