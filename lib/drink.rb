class Drink 
  attr_accessor :name,:price
  def initialize(name,price)
    @name = name 
    @price = price
  end

  def data
    {"#{@name}": "#{@price}"}
  end


  
end