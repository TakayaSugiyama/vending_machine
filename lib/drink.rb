class Drink 
  attr_reader :name, :price
  def initialize(name)
    @name = name 
    if name == 'コーラ'
      @price = 120
    elsif name == 'レッドブル'
      @price = 200
    elsif name == '水'
      @price = 100
    else
      puts "販売できません"
    end
  end
  
  #ハッシュ化
  def drink_to_hash
   {name: @name, price: @price}
  end
end