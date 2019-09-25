require "./drink"

class VendingMachine
   attr_reader :sales
    # ステップ０　お金の投入と払い戻しの例コード
    # ステップ１　扱えないお金の例コード
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    MONEY = [10, 50, 100, 500, 1000].freeze
    
    # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
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
        "購入しました"
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


  # 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
 vm = VendingMachine.new

 puts "初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。"
 vm.show_drinks

 puts "--------------------------------------------------"
 puts "リラックマ茶を10本追加する"
 vm.add("リラックマ茶", 140,10)
 vm.show_drinks

 puts "--------------------------------------------------"
 puts "500円を投入する"
 vm.slot_money(500)
 puts "残高: #{vm.current_slot_money}円"

 puts "投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。"
 puts  vm.buy_coke?

 puts "--------------------------------------------------"

 puts "コーラを1本購入する"
 vm.buy("コーラ")

 puts "リラックマ茶を1本購入する"
 vm.buy("リラックマ茶")

 puts "リラックマ茶を1本購入する"
 vm.buy("リラックマ茶")

 puts "売上を表示する"
 puts vm.sales.to_s + "円"
 puts "--------------------------------------------------"

puts "在庫を確認"
vm.show_drinks

puts "--------------------------------------------------"
puts "在庫にレッドブル（値段:200円、名前”レッドブル”）5本を追加する。"
vm.add("レッドブル", 200, 5)
puts "在庫に水（値段:100円、名前”水”）5本を追加する。"
vm.add("水", 100, 5)

puts "--------------------------------------------------"
puts "投入金額、在庫の点で購入可能なドリンクのリストを取得できる。"
puts "残高: #{vm.current_slot_money}円"
p vm.drink_lists




 