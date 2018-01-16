def cheapest_hotel(arr)
  cheapest_hotel = nil
  cheapest_price = Float::INFINITY
  cheapest_map   = {}

  arr.each do |hotel|
    hotel_id    = hotel[0]
    hotel_price = hotel[1]

    if hotel_price < cheapest_price
      cheapest_price = hotel_price
      cheapest_hotel = hotel_id
    else
      cheapest_map[hotel_id] = cheapest_hotel
    end
  end

  cheapest_map
end

arr = [
  [123, 200], [55, 150], [17, 70], [18, 500],
  [27, 270], [101, 230]
]

puts cheapest_hotel(arr)
