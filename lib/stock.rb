module StockModule
  def purchase(drink_name)
    if @drinks.map(&:name).include?(drink_name) && @having_money >= Drink.how_match?(drink_name)
      @drinks.delete_at(@drinks.map(&:name).find_index(drink_name))
      @sales += Drink.how_match?(drink_name)
      @having_money -= Drink.how_match?(drink_name)
      { "釣り銭": self.return_money, "購入商品": drink_name }
    else
      { "釣り銭": self.return_money }
    end
  end

  def purchasable_drink_list
    @drinks.map(&:name).uniq.reject { |drink_name| @having_money < Drink.how_match?(drink_name) }
  end

  def add_drink(drink_name, drink_count)
    if Drink::DRINKLIST.keys.include?(drink_name) && drink_count.to_i > 0
      drink_count.to_i.times { @drinks << Drink.new(drink_name) }
    else
      "正常に追加出来ませんでした"
    end
  end
end
