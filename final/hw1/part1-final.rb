def palindrome?(str)
	original = str.downcase.gsub(/\W/, '')
	plindromed = str.downcase.gsub(/\W/, '').reverse
	if original == plindromed
		return true
	else
		return false
	end
end

def count_words(str)
	words = str.downcase.gsub(/\W/, ' ').split
	frequencies = Hash.new(0)
	words.each do |word|
		frequencies[word] += 1
	end
	frequencies
end
