require "minitest/autorun"
require "minitest/reporters"
require "./lib/drink"
Minitest::Reporters.use!

class DrinkTest < Minitest::Test 
  def setup 
    @water = Drink.new("水", 100)
    @coke =  Drink.new("コーラ", 120)
    @redbule = Drink.new("レッドブル", 200)
  end

  def test_drink 
    assert @water
    assert @coke 
    assert @redbule
  end

  def test_to_hash
    assert_equal @water.to_hash , {name: "水", price: 100}
    assert_equal @coke.to_hash , {name: "コーラ", price: 100}
    assert_equal @redbule.to_hash , {name: "レッドブル", price: 100}
  end
end