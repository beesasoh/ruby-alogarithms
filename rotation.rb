def rotation?(str1, str2)
  return false if str1.length != str2.length
  (str2*2).include?(str1)
end

puts rotation?("waterbottle", "erbottlewa")

