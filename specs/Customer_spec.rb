require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../Customer.rb')
require_relative('../Pub.rb')
require_relative('../Drink.rb')
require_relative('../Food.rb')

class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("Father Jack", 20, 65, 0)

    @drink1 = Drink.new("Tennents", 3, 4)
    @drink2 = Drink.new("Gin and Tonic", 5, 5)
    @drink3 = Drink.new("Double Vodka and Coke", 6, 8)

    @food1 = Food.new("Chips & Cheese", 5, 2)
    @food2 = Food.new("Egg-mayo Sandwich", 2, 1)
    @food3 = Food.new("Greasy Kebab", 6, 8)

@pub_name = Pub.new("Pirn Inn", 100, [@drink1, @drink2, @drink3], [@food1, @food2, @food3])
  end

  def test_customer_name
    assert_equal("Father Jack", @customer1.customer_name)
  end

  def test_wallet_value
    assert_equal(20, @customer1.wallet_value)
  end

  def test_customer_drunkeness
    assert_equal(0, @customer1.drunkeness)
  end

  def test_customer_age
    assert_equal(65, @customer1.customer_age)
  end

  def test_customer_buys_drink
    @customer1.buy_a_drink(@drink1, @pub_name)
    assert_equal(17, @customer1.wallet_value)
    assert_equal(103, @pub_name.till_balance)
  end

  def test_customer_buys_food
    @customer1.buy_food(@food3, @pub_name)
    assert_equal(14, @customer1.wallet_value)
    assert_equal(106, @pub_name.till_balance)
    
  end


end
