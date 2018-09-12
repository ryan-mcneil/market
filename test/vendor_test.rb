require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_has_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_inventory_starts_empty
    vendor = Vendor.new("Rocky Mountain Fresh")
    expected = {}
    assert_equal expected, vendor.inventory
  end

  def test_it_can_test_the_stock_of_an_item
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_can_stock_items
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    assert_equal 30, vendor.check_stock("Peaches")
    vendor.stock("Peaches", 25)
    assert_equal 55, vendor.check_stock("Peaches")
  end

  def test_inventory_holds_stocked_items
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    expected = {"Peaches"=>55}
    assert_equal expected, vendor.inventory

    vendor.stock("Tomatoes", 12)
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, vendor.inventory
  end

  def test_vendor_can_sell
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    assert_equal 0, vendor.sell("Peaches", 20)
    assert_equal 10, vendor.check_stock("Peaches")
    assert_equal 40, vendor.sell("Peaches", 50)
    assert_equal 0, vendor.check_stock("Peaches")

  end


end
