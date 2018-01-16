dict = {}
dict.store('good', true)
dict.store('morning', true)
dict.store('jesus', true)
dict.store('is', true)
dict.store('lord', true)
dict.store('je', true)

@memo = {}
@answer = ''

def word_break(word, dict)
  return true  if word.length.zero?
  return false if @memo.key?(word)

  i = 0
  tmp_word = ''

  while i < word.length
    tmp_word += word[i]
    if dict.key? tmp_word
      if word_break(word[(i + 1)..word.length], dict)
        puts "Adding: #{tmp_word}"
        @answer += "#{tmp_word} "
        return true
      else
        i += 1
      end
    else
      i += 1
    end
  end
  @memo[word] = true
  false
end

puts word_break('goodisthepoweroflifeandthinkingstraingt', dict)
puts @answer
puts @memo
