require "./lib/drink"
require "./lib/money"
require "./lib/stock"

class VendingMachine
  attr_reader :sales, :drinks
  include MoneyModule 
  include StockModule

  def initialize
    @slot_money = 0
    @sales = 0
    @drinks = []
    5.times { @drinks << Drink.new("コーラ")}
  end

end




 