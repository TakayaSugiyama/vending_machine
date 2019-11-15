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

  def test_how_match?
    assert_equal Drink.how_match?("コーラ"), 120
    assert_equal Drink.how_match?("水"), 100 
    assert_equal Drink.how_match?("レッドブル"), 200
  end
end