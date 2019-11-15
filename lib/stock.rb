module StockModule 
  #在庫のドリンクの名前の配列を作成する
  def stocked_drinks_name
    @drinks.map(&:name)
  end

  # コーラが買えるかどうか? 投入金額、在庫の点で、コーラが購入できるかどうかを取得できる( ステップ3 )
  def can_purchase_coke?
    current_slot_money >= 120 && stocked_drinks_name.include?("コーラ") ?  "買えます": "買えません"
  end

  #ドリンクを購入する
  def purchase(drink_name) 
    #ドリンクの在庫ある? かつ ドリンクを買うお金ある?
    if stocked_drinks_name.include?(drink_name) && current_slot_money >= Drink.how_match?(drink_name)
      #あったからドリンクの在庫を１つ削除する
      @drinks.delete_at( stocked_drinks_name.find_index(drink_name) )
      #そして売上をドリンク代、増やす。
      @sales += Drink::DRINKLIST[drink_name]   
      #釣り銭と購入商品を返す。
      {"釣り銭": self.current_slot_money - @sales, "購入商品": drink_name}
    else 
      #在庫がなかった。
      "在庫がありません"
    end
  end

  #購入可能なドリンクを出力する
  def purchasable_drink_list
    stocked_drinks_name.uniq.reject {|drink_name| current_slot_money <= Drink.how_match?(drink_name)}
  end

  #ドリンクを追加する( ドリンク名, 追加するドリンクの数 ) 
  def add_drink(drink_name,drink_count)
    if Drink::DRINKLIST.keys.include?(drink_name) && drink_count.to_i > 0
      drink_count.to_i.times {@drinks << Drink.new(drink_name)}
    else  
      "正常に追加出来ませんでした"
    end
  end

  

end