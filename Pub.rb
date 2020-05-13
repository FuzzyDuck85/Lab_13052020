class Pub
  attr_accessor :pub_name, :till, :drinks

  def initialize(pub_name, till, drinks)
    @pub_name = pub_name
    @till = 100
    @drinks = drinks
  end

  def drinks_stock
    return @drinks.size
  end

  def till_balance
    return @till
  end

  def sell_drink(drink)
    @till += drink.price
    sold_drink = @drinks.delete(drink)
    return sold_drink
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
