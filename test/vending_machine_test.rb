require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!
require "./lib/drink"
require "./lib/vending_machine"

class VendingMachineTest < Minitest::Test
  def setup
    @vm = VendingMachine.new
  end

  def test_vending_machine
    assert @vm
  end
end
