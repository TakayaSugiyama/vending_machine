class Drink 
  
  def initialize(name,price)
    @name = name 
    @price = price
  end

  def to_h
   {name: @name, price: @price}
  end


  
end