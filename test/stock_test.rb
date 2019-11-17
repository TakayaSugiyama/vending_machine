require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!
require "./lib/drink"
require "./lib/vending_machine"
require "./lib/stock"
require "./lib/money"


class StockTest < Minitest::Test 
  def setup 
    @vm  = VendingMachine.new
  end
  
  def test_purchase
   @vm.slot_money 500
   assert_equal  @vm.purchase("コーラ"),{"釣り銭": 380, 
    "購入商品": "コーラ"}
   assert_equal  @vm.purchase("コーラ"),  {"釣り銭": 0}
  end
  
  def test_add_drink
    @vm.add_drink("水", 2)
    @vm.add_drink("レッドブル", 4)
    assert_equal @vm.stocked_drink_names.uniq , %w(コーラ  水 レッドブル)
    assert_equal @vm.stocked_drink_names.count("コーラ"), 5
    assert_equal @vm.stocked_drink_names.count("水"), 2
    assert_equal @vm.stocked_drink_names.count("レッドブル"), 4
  end

  def test_purchasable_drink_list
    @vm.add_drink("水", 2)
    @vm.slot_money 100
    assert_equal @vm.purchasable_drink_list , %w(水)
    @vm.slot_money 100
    assert_equal @vm.purchasable_drink_list, %w(コーラ 水)
  end

end