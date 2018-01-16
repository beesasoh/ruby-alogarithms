def add(num1, num2)
	return num1 + num2
end


def is_it? str
	str.split("").uniq.size == str.size
end