require "minitest/autorun"
require "minitest/reporters"
require "./lib/drink"
Minitest::Reporters.use!

class DrinkTest < Minitest::Test 
  def setup 
    @drink = Drink.new("リラックマ茶", 1000)
  end

  def test_drink 
    assert @drink
  end

  def test_to_h 
    assert_equal @drink.to_h , {name: "リラックマ茶", price: 1000}
  end
end