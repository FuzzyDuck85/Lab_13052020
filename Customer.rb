class Customer

  attr_accessor :customer_name, :wallet, :age, :drunkeness

  def initialize(customer_name, wallet, age, drunkeness)
    @customer_name = customer_name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness

  end

  def wallet_value()
    return @wallet
  end

  def drunkeness()
    return @drunkeness
  end

  def customer_age()
    return @age
  end

  def buy_a_drink(drink, pub_name)
    pub_name.sell_drink(drink)
    @wallet -= drink.price
    @drunkeness += drink.alcohol_level
    p drunkeness
  end

  def buy_food(food, pub_name)
    pub_name.sell_food(food)
    @wallet -= food.price
    @drunkeness -= food.rejuvination_level
    p drunkeness
  end
end
