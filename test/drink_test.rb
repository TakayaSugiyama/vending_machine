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
end