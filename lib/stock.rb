module StockModule 
  #在庫の数を返す
  def count_drinks(name)
    count = 0
    @drinks.each do |drink|
      count += 1 if drink.drink_to_hash[:name] == name
    end
    count
  end

  #格納されているジュースの情報（値段と名前）を取得できる。
  def juice_info
    @drinks.map {|drink| {name: drink.name, price: drink.price} }.uniq
  end

  #コーラを買えるかどうかを返す
  def buy_coke?
    if @slot_money >= 120  && self.count_drinks("コーラ") > 0
      "買えます"
    else 
      "買えません"
    end
  end

   #ドリンクを追加する 
   def add(name,count)
    count.times {@drinks << Drink.new(name) }
   end
   
end