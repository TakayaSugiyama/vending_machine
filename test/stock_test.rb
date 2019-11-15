require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!
require "./lib/drink"
require "./lib/vending_machine"
require "./lib/money"
require "./lib/stock"


class StockTest < Minitest::Test 
  def setup 
    @vm  = VendingMachine.new
  end

  def test_juice_info 
    assert_equal @vm.juice_info, [{name: "コーラ", price: 120}]
  end

  def test_add
    @vm.add("水", 10)
    assert_equal  @vm.juice_info, [{name: "コーラ", price: 120},
                                   {name: "水", price: 100}]
  end

  def test_count_drinks
    assert_equal @vm.count_drinks("コーラ"), 5
  end


  def test_buy_coke? 
    assert_equal @vm.buy_coke? , "買えません"
    @vm.slot_money 1000
    assert_equal @vm.buy_coke? , "買えます"
  end

end