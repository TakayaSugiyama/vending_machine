module  MoneyModule 
  
  def return_money 
    slot_money = @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
    # 返すお金の金額を表示する
    slot_money
  end


 #値段を返す
 def price(buy_drink_name)
  drink_price = 0
  self.data_juice.each do |data|
    data.each do |name,price|
       drink_price += price.to_i  if buy_drink_name == name.to_s
    end
  end
   drink_price
 end

 #ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
 def buy(name)
    last_money = 0
    if self.count(name) > 0 && @slot_money >= self.price(name)
      count = 0
      @sales +=  self.price(name)
      @slot_money -=  self.price(name)
      @drinks.each do |drink|
        if drink.name == name 
           @drinks.delete(drink) if count == 0
           count += 1
        end
      end
      last_money = @slot_money
      @slot_money = 0
      {"釣り銭": last_money, "購入商品": name}
    else 
      last_money = @slot_money
      @slot_money = 0
      {"釣り銭": last_money}
    end
  end
  
end