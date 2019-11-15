require "minitest/autorun"
require "minitest/reporters"
require "./lib/drink"
Minitest::Reporters.use!

class DrinkTest < Minitest::Test 
  def setup 
    @water = Drink.new("水")
    @coke =  Drink.new("コーラ")
    @redbule = Drink.new("レッドブル")
  end

  def test_drink 
    assert @water
    assert @coke 
    assert @redbule
  end

  def test_drink_to_hash
    assert_equal @water.drink_to_hash , {name: "水", price: 100}
    assert_equal @coke.drink_to_hash , {name: "コーラ", price: 120}
    assert_equal @redbule.drink_to_hash , {name: "レッドブル", price: 200}
  end
end