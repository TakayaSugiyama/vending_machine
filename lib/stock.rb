module StockModule 
  #在庫の数を返す
  def count_drinks(name)
    @drinks.map(&:name).count(name)
  end

  #格納されているジュースの情報（値段と名前）を取得できる。
  def juice_info
    @drinks.map {|drink| {name: drink.name, price: drink.price} }.uniq
  end

  #コーラを買えるかどうかを返す
  def buy_coke?
    @slot_money >= 120  && count_drinks("コーラ") > 0 ? "買えます" : "買えません"
  end

   #ドリンクを追加する 
   def add(name,count)
    count.times {@drinks << Drink.new(name) }
   end
end