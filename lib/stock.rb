module StockModule 
  #在庫の数を返す
  def count_drinks(name)
    count = 0
    @drinks.each do |drink|
      count += 1 if drink.to_h[:name] == name
    end
    count
  end

  #格納されているジュースの情報（値段と名前）を取得できる。
  def data_juice
    added_names = []
    results = []
     @drinks.map {|drink| drink.to_h}.each do |data|
      added_names << data[:name]
       if added_names.count(data[:name]) == 1
          results <<  data
       end
     end 
     results
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
   def add(name,price,count)
    count.times {@drinks << Drink.new(name,price) }
   end
end