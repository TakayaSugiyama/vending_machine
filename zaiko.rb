class Zaiko 
    #追加
    def add
      @stock_drinks = [{name:"コーラ", price: 120,count: 5}]
      @stock_drinks << {name: "オレンジ",price:100, count: 3}
    end

    #表示
    def show 
      @stock_drinks.each do |drink|
        puts "#{drink[:price]}円の#{drink[:name]}は#{drink[:count]}個です。"
      end
    end
  end

end
