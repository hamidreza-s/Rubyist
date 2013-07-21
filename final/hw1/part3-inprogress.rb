def combine_anagrams(words)
	result = []
	mentioned = []
	words.each do |x|
		x_x = x.downcase.each_char.sort.join
		next if mentioned.include?(x_x)
		temp = []
		words.each do |y|
			y_y = y.downcase.each_char.sort.join
			temp << y if x_x == y_y
		end
		result << temp
		mentioned << x_x
	end
	result
end

input = ['Cars', 'For', 'Potatoes', 'Racs', 'Four', 'Scar', 'Creams', 'Scream']
puts combine_anagrams(input).inspect

# output: [ ["cars", "racs", "scar"],
#           ["for"],
#           ["four"],
#           ["potatoes"],
#           ["creams", "scream"] ]
