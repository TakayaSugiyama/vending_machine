require "./drink"

class VendingMachine
   attr_reader :sales
    MONEY = [10, 50, 100, 500, 1000].freeze
    
    def initialize
      # 最初の自動販売機に入っている金額は0円
      @slot_money = 0
      @sales = 0
      @drinks = []
      5.times { @drinks << Drink.new("コーラ", 120)}
    end
  
    # 投入金額の総計を取得できる。
    def current_slot_money
      # 自動販売機に入っているお金を表示する
      @slot_money
    end
  
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    # 投入は複数回できる。
    def slot_money(money)
      # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
      # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
      if MONEY.include?(money)
      # 自動販売機にお金を入れる
        @slot_money += money
        #nil
      else
        money
      end
    end

  
    def return_money 
      slot_money = @slot_money
      # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
      # 返すお金の金額を表示する
      slot_money
    end

    #在庫の数を返す
    def count(name)
      count = 0
      @drinks.each do |drink|
        count += 1 if drink.name == name
      end
      count
    end
    
    #格納されているジュースの情報（値段と名前）を取得できる。
    def data_juice
      added_names = []
      results = []
       @drinks.map {|drink| drink.data}.each do |data|
        added_names << data
         if added_names.count(data) == 1
            results <<  data
         end
       end 
       results
    end

    # 格納されているジュースの情報（値段と名前と個数）を表示できる。
    def show_drinks
      self.data_juice.each do |data|
        data.each do |name,price|
           puts  "#{price}円の#{name}が#{self.count(name.to_s)}本"
        end
      end
    end

    #コーラを買えるかどうかを返す
    def buy_coke?
      if @slot_money >= 120  && self.count("コーラ") > 0
        "買えます"
      else 
        "買えません"
      end
    end

    #ドリンクを追加する 
   def add(name,price,count)
       count.times {@drinks << Drink.new(name,price) }
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
        {"釣り銭": @slot_money, "購入商品": name}
      else 
          "買えませんでした。"
      end
   end

   #投入金額、在庫の点で購入可能なドリンクのリストを表示する。
   def drink_lists
      results = []
      self.data_juice.each do |data|
        data.each do |name,price|
           results << name.to_s  if @slot_money >= price.to_i
        end
      end
      results
   end

end




 