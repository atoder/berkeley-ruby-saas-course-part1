class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name, @calories = name, calories
  end
  def healthy?
    (@calories < 200 ) ? true : false
  end
  def delicious?
    true    
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor, @calories, @name = flavor, 5, flavor + " jelly bean"
  end
  def delicious?
    if flavor == "licorice"
      false
    else
      super
    end
  end
end
