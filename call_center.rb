class User
  attr_accessor :login, :logout

  def initialize(login, logout)
    @login = login
    @logout = logout
  end

  def self.create_users
    users = []
    users << User.new(1, 3)
    users << User.new(3, 4)
    users << User.new(1, 2)
    users << User.new(1, 3)
    users << User.new(1, 3)
    users << User.new(1231231, 9879879)
    users
  end
end

def max_logged_in_users
  max = 0
  hash_store = {}
  users = User.create_users

  users.each do |user|
    range = (user.login..user.logout).to_a
    range.each do |num|
      if hash_store.key?(num)
        hash_store[num] += 1
        max = hash_store[num] if hash_store[num] > max
      else
        hash_store[num] = 1
      end
    end
  end
  max
end

puts max_logged_in_users
