require "minitest/autorun"
require "./lib/drink"
require "./lib/vending_machine"
require "./lib/money"
require "./lib/stock"

class VendingMachineTest < Minitest::Test 

  #クラスが作れるかどうか
  def test_vending_machine 
    assert VendingMachine.new
  end
end