def fact(num)
  num <= 1 ? 1 : num * fact(num - 1)
end


def fact2(num)
	num.downto(1).reduce(:*)
end


