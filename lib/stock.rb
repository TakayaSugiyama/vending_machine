module StockModule 
  def stocked_drinks_name
    @drinks.map(&:name)
  end

  def can_purchase_coke?
    current_slot_money >= 120 && stocked_drinks_name.include?("コーラ") ?  "買えます": "買えません"
  end

  def purchase(drink_name) 
    if stocked_drinks_name.include?(drink_name) && current_slot_money  >= Drink.how_match?(drink_name)
      @drinks.delete_at( stocked_drinks_name.find_index(drink_name) )
      @sales += Drink.how_match?(drink_name)
      @slot_money -= @sales  
      {"釣り銭": self.return_money, "購入商品": drink_name}
    else  
      {"釣り銭": self.return_money}
    end
  end

  def purchasable_drink_list
    stocked_drinks_name.uniq.reject {|drink_name| current_slot_money < Drink.how_match?(drink_name)}
  end

  def add_drink(drink_name,drink_count)
    if Drink::DRINKLIST.keys.include?(drink_name) && drink_count.to_i > 0
      drink_count.to_i.times {@drinks << Drink.new(drink_name)}
    else  
      "正常に追加出来ませんでした"
    end
  end

end
