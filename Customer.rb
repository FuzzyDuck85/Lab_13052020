class Customer

  attr_accessor :customer_name, :wallet, :age

  def initialize(customer_name, wallet, age)
    @customer_name = customer_name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness

  end

  def wallet_value()
    return @wallet
  end

  def customer_age()
    return @age
  end

  def buy_a_drink(drink, pub_name)
    pub_name.sell_drink(drink)
    @wallet -= drink.price

  end

end
