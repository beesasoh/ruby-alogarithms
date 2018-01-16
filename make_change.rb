@memo = {}

def make_change(coins, money)
  compute_ways(coins, money, 0)
end

def compute_ways(coins, money, index)
  return 1 if money.zero?
  return 0 if index >= coins.length

  key = "#{money}_#{index}"
  return @memo[key] if @memo.key?(key)

  amount_with_coin = 0
  ways = 0
  while amount_with_coin <= money
    remaining = money - amount_with_coin
    ways += compute_ways(coins, remaining, index + 1)
    amount_with_coin += coins[index]
  end
  @memo[key] = ways
  ways
end

def make_change_2(coins, money)
  table = create_table(coins, money)
  table = populate_table(table, coins)
  table.last.last
end

def  create_table(coins, money)
  arr = []
  size_coins = coins.length

  size_coins.times do
    arr << Array.new(money + 1, 0)
  end
  arr
end

def populate_table(table, coins)
  coins = coins.sort

  table.each_with_index do |row, i|
    row.each_with_index do |_col, j|
      table[i][j] = 1 if i.zero? || j.zero?
    end
  end

  table.each_with_index do |row, i|
    row.each_with_index do |_value, j|
      next if i.zero? || j.zero?

      table[i][j] = if j >= coins[i]
                      table[i - 1][j] + table[i][j - coins[i]]
                    else
                      table[i - 1][j]
                    end
    end
  end
  table
end

def make_change_3(coins, money)
  ways = Array.new(money + 1, 0)
  ways[0] = 1

  coins.each do |coin|
    ways.each_with_index do |way, current_value|
      ways[current_value] += ways[current_value - coin] if current_value >= coin
    end
  end
  ways.last
end

def print_table(arr)
  arr.each do |row|
    p row
  end
end

# puts make_change_2((1..200).select{|num| num%2==1}, 200)
# puts ''
#puts make_change((1..200).select{|num| num%2==1}, 200)

# puts make_change((1..200).select{|num| num%2==1}, 200)
# puts @memo

puts make_change_3([5,2,1], 7)
