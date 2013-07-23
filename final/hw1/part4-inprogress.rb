class Dessert
  def initialize(name, calories)
		@name = name
		@calories = calories
  end
  
	def get_name
		@name
	end

	def set_name(name)
		@name = name
	end

	def get_calories
		@calories
	end

	def set_calories(calories)
		@calories = calories
	end

  def healthy?
		true if @calories < 200
  end
  
  def delicious?
		true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
  end
  
  def delicious?
		if @flavor == "black licorice"
			return false
		else
			return true
		end
  end

	def get_flavor
		@flavor
	end
	
	def set_flavor(flavor)
		@flavor = flavor
	end
end

my_dessert = Dessert.new('Mast', 199)
puts my_dessert.get_name
puts my_dessert.set_name('Borani')
puts my_dessert.get_name
puts my_dessert.get_calories
puts my_dessert.set_calories(250)
puts my_dessert.get_calories
puts my_dessert.delicious? ? 'Delicious' : 'Not Delicious'
puts my_dessert.healthy? ? 'Healthy' : 'Not Healthy'

puts '---'

my_jelly = JellyBean.new('Kindel', 199, 'Bitter')
puts my_jelly.get_name
puts my_jelly.set_name('Borani')
puts my_jelly.get_name
puts my_jelly.get_calories
puts my_jelly.set_calories(250)
puts my_jelly.get_calories
puts my_jelly.get_flavor
puts my_jelly.set_flavor("black licorice")
puts my_jelly.get_flavor
puts my_jelly.delicious? ? 'Delicious' : 'Not Delicious'
puts my_jelly.healthy? ? 'Healthy' : 'Not Healthy'
