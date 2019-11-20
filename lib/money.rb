module MoneyModule
  MONEY = [10, 50, 100, 500, 1000].freeze

  def slot_money(money)
    MONEY.include?(money) ? (@having_money += money; "#{money}円を投入しました。") : "#{money}円は投入できませんでした"
  end

  def return_money
    having_money, @having_money = @having_money, 0; having_money
  end
end
