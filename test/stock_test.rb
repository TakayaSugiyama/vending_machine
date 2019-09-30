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

  def test_data_juice 
    assert_equal @vm.data_juice, [{name: "コーラ", price: 120}]
  end

  def test_add
    @vm.add("オレンジ", 150, 10)
    assert_equal  @vm.data_juice, [{name: "コーラ", price: 120},
                                   {name: "オレンジ", price: 150}]
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