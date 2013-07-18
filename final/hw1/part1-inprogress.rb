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
end
