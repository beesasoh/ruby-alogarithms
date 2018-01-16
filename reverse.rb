def reverse(str)
  stack = []
  i = 0

  while i < str.length
    stack.push(str[i])
    i += 1
  end

  word = ''
  word << stack.pop until stack.empty?
  word
end
