class Pub
  attr_accessor :pub_name, :till, :drinks, :food

  def initialize(pub_name, till, drinks, food)
    @pub_name = pub_name
    @till = 100
    @drinks = drinks
    @food = food
  end

  def drinks_stock
    return @drinks.size
  end

  def food_stock
    return @food.size
  end

  def till_balance
    return @till
  end

  def sell_drink(drink)
    @till += drink.price
    sold_drink = @drinks.delete(drink)
    return sold_drink
  end

  def sell_food(food)
    @till += food.price
    sold_food = @food.delete(food)
    return sold_food
  end

  def drunkeness(customer)
    result = false
      if customer.drunkeness >= 16
        return true
      end
    return result
  end

  def over_18(customer)
    result = false
      if customer.age >= 18
        return true
      end
    return result
    # case(customer.age)
    #   when >= 18
    #     true
    #   else =< 17
    #     false
    #   end
  end
end
