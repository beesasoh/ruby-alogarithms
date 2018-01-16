n = gets.chomp.to_i

@search_index = Hash.new(0)
n.times do
  s = gets.chomp
  @search_index[s] += 1
end

query_num = gets.chomp.to_i

queries = []
query_num.times do
  q = gets.chomp
  queries << q
end

queries.each do |q|
  puts @search_index[q] || 0 
end
