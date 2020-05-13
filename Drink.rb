class Drink

  attr_accessor :drink_name, :price, :alcohol_level

  def initialize(drink_name, price, alcohol_level)
    @drink_name = drink_name
    @price = price
    @alcohol_level = alcohol_level
  end

end
