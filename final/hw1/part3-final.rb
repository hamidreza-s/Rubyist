def combine_anagrams(words)
	result = []
	mentioned = []
	words.each do |x|
		x_x = x.each_char.sort.join
		next if mentioned.include?(x_x)
		temp = []
		words.each do |y|
			y_y = y.each_char.sort.join
			temp << y if x_x == y_y
		end
		result << temp
		mentioned << x_x
	end
	result
end
