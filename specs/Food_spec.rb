require('minitest/autorun')
require('minitest/reporters')

require_relative('../drink')
require_relative('../pub')
require_relative('../customer')
require_relative('../food')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestFood < Minitest::Test

  def setup()
    @food1 = Food.new("Chips & Cheese", 5, 2)
    @food2 = Food.new("Egg-mayo Sandwich", 2, 1)
    @food3 = Food.new("Greasy Kebab", 6, 8)

  end

  def test_food_name()
    assert_equal("Egg-mayo Sandwich", @food2.food_name)
  end

  def test_food_price()
    assert_equal(6, @food3.price)
  end

  def test_food_rejuvination_level()
    assert_equal(2, @food2.rejuvination_level)
  end

end
