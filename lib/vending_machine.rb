require "./lib/drink"
require "./lib/money"
require "./lib/stock"

class VendingMachine
  attr_reader :sales, :drinks
  include MoneyModule 
  include StockModule

  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    #最初の売上は0円
    @sales = 0
    #drinksという配列を作って、5個のコーラを代入する
    @drinks = []
    5.times { @drinks << Drink.new("コーラ")}
  end

end




 