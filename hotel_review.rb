# class for hotel
class Hotel
  attr_accessor :reviews, :name

  def initialize(name, reviews)
    @name = name
    @reviews = reviews
  end

  def self.create_hotels
    hotels = [
      Hotel.new('Sheraton', reviews = [
                  'five star hotels', 'Uganda hotel',
                  'gym nice', 'spa good'
                ]),
      Hotel.new('Hilton', reviews = [
                  'five star hotel', 'Uganda hotel, five star'
                ]),
      Hotel.new('Serena', reviews = [
                  'five star hotel', 'Five star Uganda hotel',
                  'only five star Uganda hotel'
                ])
    ]
    hotels
  end

  def review_map
    hashmap = {}
    reviews.each do |review|
      review.split(' ').each do |word|
        word = word.downcase
        if hashmap.key? word
          hashmap[word] += 1
        else
          hashmap[word] = 1
        end
      end
    end
    hashmap
  end

  def weight(keyword)
    review_map[keyword] || 0
  end
end

def search(keyword)
  rankings = {}
  Hotel.create_hotels.each do |hotel|
    rankings[hotel.name] = hotel.weight(keyword)
  end
  rankings.sort_by { |_key, value| value }.reverse
end

p search('five star')
