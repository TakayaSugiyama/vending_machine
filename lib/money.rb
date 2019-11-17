module  MoneyModule 
    MONEY = [10, 50, 100, 500, 1000].freeze
    def current_slot_money
      @slot_money
    end

    def slot_money(money)
      if MONEY.include?(money)
        @slot_money += money
        "#{money}円を投入しました。"
      else
        "#{money}円は投入できませんでした"
      end
    end

    def return_money 
      slot_money = @slot_money
      @slot_money = 0
      slot_money
    end

end