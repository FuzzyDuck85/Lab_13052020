class Food

  attr_accessor :food_name, :price, :rejuvination_level

  def initialize(food_name, price, rejuvination_level)
    @food_name = food_name
    @price = price
    @rejuvination_level = rejuvination_level
  end

end
