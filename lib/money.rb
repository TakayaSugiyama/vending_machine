module  MoneyModule 

 #値段を返す
 def drink_price(name) 
    drink_names = juice_info.map{|drink| drink[:name]}
    if drink_names.include?(name)
      juice_info.map{|info| info[:price]}.first
    else  
      "在庫がありません"
    end
 end

 #ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
 def buy(name)
    if self.count_drinks(name) > 0 && @slot_money >= self.drink_price(name)
      count = 0
      @sales +=  self.drink_price(name)
      @slot_money -=  self.drink_price(name)
      @drinks.each do |drink|
        if drink.drink_to_hash[:name] == name 
           @drinks.delete(drink) if count == 0
           count += 1
        end
      end
      {"釣り銭": self.return_money, "購入商品": name}
    else 
      {"釣り銭": self.return_money}
    end
  end
  
end