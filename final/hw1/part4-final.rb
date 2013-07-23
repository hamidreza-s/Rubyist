class Dessert
	attr_accessor :name, :calories
  def initialize(name, calories)
		@name = name
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
	attr_accessor :name, :calories, :flavor
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
end
