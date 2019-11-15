class Drink 
  attr_reader :name, :price
  DRINKLIST = {"コーラ" => 120, "水" => 100, "レッドブル" => 200 }

  def initialize(name)
    @name = name 
    @price = DRINKLIST[name]
  end
  
  #値段を返す
  def self.how_match?(name)
    DRINKLIST.keys.include?(name) ? DRINKLIST[name] : "在庫がありません"
  end

end