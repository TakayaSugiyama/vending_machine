require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!
require "./lib/drink"
require "./lib/vending_machine"
require "./lib/money"
require "./lib/stock"

class VendingMachineTest < Minitest::Test 

  def setup 
    @vm = VendingMachine.new
  end
  #クラスが作れるかどうか
  def test_vending_machine 
    assert @vm
  end


  #100円は受け入れる, 100000円は受け入れない
  def test_current_slot_money 
    @vm.slot_money(100)
    assert_equal @vm.current_slot_money, 100
    @vm.return_money 
    @vm.slot_money(100000) 
    assert_equal @vm.current_slot_money, 0
  end

  #購入可能なドリンクリストが帰ってくる
  def test_drink_lists 
    @vm.slot_money(500)
    assert_equal @vm.drink_lists,["コーラ"]
  end

  

  
end