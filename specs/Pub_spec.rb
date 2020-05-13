require('minitest/autorun')
require('minitest/reporters')
require_relative('../Pub.rb')
require_relative('../Customer.rb')
require_relative('../Drink.rb')
require_relative('../food.rb')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class PubTest < MiniTest::Test
  def setup()
    @customer1 = Customer.new("Father Jack", 20, 65, 0)

    @drink1 = Drink.new("Tennents", 3, 4)
    @drink2 = Drink.new("Gin and Tonic", 5, 5)
    @drink3 = Drink.new("Double Vodka and Coke", 6, 8)

    @food1 = Food.new("Chips & Cheese", 5, 2)
    @food2 = Food.new("Egg-mayo Sandwich", 2, 1)
    @food3 = Food.new("Greasy Kebab", 6, 8)

    @pub_name = Pub.new("Pirn Inn", 100, [@drink1, @drink2, @drink3], [@food1, @food2, @food3])


  end

  def test_does_pub_have_name()
    assert_equal("Pirn Inn", @pub_name.pub_name)
  end

  def test_initial_drinks_stock
    assert_equal(3, @pub_name.drinks_stock)
  end

  # def test_drink_stock_value(@drink1, @drink2, @drink3)
  #   actual = @pub_name.test_drink_stock_value
  #   assert_equal(14, actual)

  def test_till_balance()
    assert_equal(100,@pub_name.till_balance)
  end

  def test_customer_pished
    actual = @pub_name.drunkeness(@customer1)
    assert_equal(false, actual)
  end

  def test_over_18
    actual = @pub_name.over_18(@customer1)
    assert_equal(true, actual)
  end

  def test_can_sell_drink
    @pub_name.sell_drink(@drink1)
    assert_equal(2, @pub_name.drinks.size)
  end

  def test_can_sell_multiple_drinks
    @pub_name.sell_drink(@drink1)
    @pub_name.sell_drink(@drink2)
    @pub_name.sell_drink(@drink3)
    assert_equal(0, @pub_name.drinks.size)
  end

  def test_drink_transaction_not_drunk
    actual = @pub_name.over_18(@customer1)
    assert_equal(true, actual)
    actual = @pub_name.drunkeness(@customer1)
    assert_equal(false, actual)
    @customer1.buy_a_drink(@drink1, @pub_name)
    assert_equal(2, @pub_name.drinks.size)
    assert_equal(17, @customer1.wallet_value)
    assert_equal(103, @pub_name.till_balance)
    p "Ah go on Father, take a drink"
  end

  def test_drink_transaction_drunk
    actual = @pub_name.over_18(@customer1)
    assert_equal(true, actual)
    @customer1.buy_a_drink(@drink1, @pub_name)
    @customer1.buy_a_drink(@drink2, @pub_name)
    @customer1.buy_a_drink(@drink3, @pub_name)
    actual = @pub_name.drunkeness(@customer1)
    assert_equal(true, actual)
    assert_equal(0, @pub_name.drinks.size)
    assert_equal(6, @customer1.wallet_value)
    assert_equal(114, @pub_name.till_balance)
    p "Feck off you eejit, you're too drunk!"
  end

  def test_drink_and_food_transaction
    actual = @pub_name.over_18(@customer1)
    assert_equal(true, actual)
    actual = @pub_name.drunkeness(@customer1)
    assert_equal(false, actual)
    @customer1.buy_a_drink(@drink1, @pub_name)
    @customer1.buy_food(@food1, @pub_name)
    assert_equal(2, @pub_name.drinks.size)
    assert_equal(12, @customer1.wallet_value)
    assert_equal(108, @pub_name.till_balance)
    p "Ah go on Father, take a drink"
  end


end
