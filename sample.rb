require "./drink"
require "./money"


class VendingMachine
    # ステップ０　お金の投入と払い戻しの例コード
    # ステップ１　扱えないお金の例コード
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    MONEY = [10, 50, 100, 500, 1000].freeze
    
    # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
    def initialize
      # 最初の自動販売機に入っている金額は0円
      @slot_money = 0
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
    
    #格納されているジュースの情報（値段と名前と個数）を取得できる。
    def data_juice
      added_names = []
      results = []
       @drinks.map {|drink| drink.data}.each do |k,v|
        names << k
         if names.count(k) == 1
            results <<  k
         end
       end 
       results
    end

end


  # 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
 vm = VendingMachine.new
 p vm.data_juice