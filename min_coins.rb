@memo = {}
def min_coins(coins, value)
  return 0 if value <= 0
  return @memo[value] if @memo.key? value

  tmp_min = Float::INFINITY

  coins.each do |coin|
    if value >= coin
      ways = min_coins(coins, value - coin)
      tmp_min = [tmp_min, ways].min
    end
  end

  results = 1 + tmp_min
  @memo[value] = results
  results
end

def max_coins(coins, value)
  return 0 if value <= 0
  return @memo[value] if @memo.key? value

  tmp_min = -Float::INFINITY

  coins.each do |coin|
    if value >= coin
      ways = max_coins(coins, value - coin)
      tmp_min = [tmp_min, ways].max
    end
  end

  results = 1 + tmp_min
  @memo[value] = results
  results
end

puts max_coins([2, 3, 5], 11)
#puts min_coins([1, 2, 3, 5], 4)
puts @memo
