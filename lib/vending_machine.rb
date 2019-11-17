require "./lib/drink"
require "./lib/money"
require "./lib/stock"

class VendingMachine
  attr_reader :sales, :drinks, :having_money
  include MoneyModule 
  include StockModule

  def initialize
    @having_money = 0
    @sales = 0
    @drinks = Array.new(5,Drink.new("コーラ"))
  end 
  
end




 