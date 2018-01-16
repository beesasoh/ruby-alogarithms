@open_chars = '{[('
@close_chars = '}])'

def balanced_braces?(str)
  stack = []

  str.each_char do |char|

    if opening_brace?(char)
      stack.push(char)
      next
    end

    if closing_brace?(char)
      if matches_stack_head?(stack.last, char)
        stack.pop
      else
        return false
      end
    end

  end

  stack.empty?
end

def opening_brace?(char)
  @open_chars.include?(char)
end

def closing_brace?(char)
  @close_chars.include?(char)
end

def matches_stack_head?(head, char)
  head == char.tr(@close_chars, @open_chars)
end

puts balanced_braces?('([{}])()[]{}')
