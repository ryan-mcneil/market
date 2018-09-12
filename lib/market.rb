class Market
  attr_reader :name, :vendors

  def initialize(name)
      @name = name
      @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    @vendors.inject([]) do |array, vendor|
      array << vendor.inventory.keys
    end.flatten.uniq.sort
  end

  def total_inventory
    hash = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, stock|
        hash[item] += stock
      end
    end
    hash
  end

  def sell(item, count)
    if total_inventory[item] > count
      


  end


end
