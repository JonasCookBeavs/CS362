# Jonas Cook

class IceBoxRefrigerator

  attr_reader :height, :width, :depth

  def initialize(height = 0, width = 0, depth = 0)
    @height = height
    @width = width
    @depth = depth
  end

  def add(beverage)
  end
end

class BrokenRefrigerator

  attr_reader :height, :width, :depth

  def initialize(height = 0, width = 0, depth = 0)
    @height = height
    @width = width
    @depth = depth
  end

  def add(beverage)
  end

end

class RootBeer; end
class Kombucha; end

class Kitchen

  def initialize(refrigerator = IceBoxRefrigerator.new)
    @refrigerator = refrigerator
  end

  def add_beer_to_refrigerator
    add_drink(RootBeer.new)
  end

  def add_drink(drink)
    @refrigerator.add(drink)
  end

  def to_s
    fridge_volume = @refrigerator.height * @refrigerator.width * @refrigerator.depth
    fridge_volume_gallons = fridge_volume * 7.48052
    "Kitchen. Fridge volume = #{fridge_volume_gallons} gallons"
  end

end

# Current usage example:

kitchen = Kitchen.new()
kitchen.add_beer_to_refrigerator
puts kitchen

r = BrokenRefrigerator.new
ko = Kombucha.new
kitchen2 = Kitchen.new(r)
kitchen2.add_drink(ko)
puts kitchen2
# kitchen has an IceBoxRefrigerator with a RootBeer in it.

# Problem: you can't create a kitchen with a different fridge, and you can't
#          add any beverage other than beer.

# Goal: Create a kitchen with a BrokenRefrigerator, and add Kombucha to it.

