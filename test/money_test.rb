require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!
require "./lib/drink"
require "./lib/vending_machine"
require "./lib/money"
require "./lib/stock"

class MoneyTest < Minitest::Test 
   def setup 
      @vm = VendingMachine.new
   end
   
   def test_drink_price
    assert_equal @vm.drink_price("コーラ"), 120 
    assert_equal @vm.drink_price("水"), 100
    assert_equal @vm.drink_price("レッドブル"), 200
    assert_equal @vm.drink_price("オレンジ"), "在庫がありません"
   end

   def test_buy
     @vm.slot_money 1000
     assert_equal @vm.buy("コーラ"), {"釣り銭": 880, "購入商品": "コーラ"}
   end
end