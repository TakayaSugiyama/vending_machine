require "./lib/drink"
require "./lib/money"
require "./lib/stock"

class VendingMachine
   attr_reader :sales
   include StockModule
   include MoneyModule 
   
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


   #投入金額、在庫の点で購入可能なドリンクのリストを表示する。
   def drink_lists
      results = []
      self.data_juice.each do |data|
        results << data[:name]  if @slot_money >= data[:price]
      end
      results
   end

end




 