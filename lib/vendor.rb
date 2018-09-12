class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, count)
    @inventory[item] += count
  end

  def sell(item, count)
    if count > @inventory[item]
      count -= @inventory[item]
      @inventory[item] = 0
      count
    else
      @inventory[item] -= count
      0
    end
  end



  # def items_in_stock
  #   @inventory.map do |item, count|
  #     item
end
