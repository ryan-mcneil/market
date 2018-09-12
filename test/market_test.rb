require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'

class MarketTest < Minitest::Test

  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

  def test_it_has_a_name
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", market.name
  end

  def test_vendors_starts_empty
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal [], market.vendors
  end

  def test_it_can_add_a_vendor
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    market.add_vendor(vendor_1)
    assert_equal [vendor_1], market.vendors
    market.add_vendor(vendor_2)
    assert_equal [vendor_1, vendor_2], market.vendors
  end

  def test_it_can_return_vendor_names
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    market.add_vendor(vendor_1)
    expected = ["Rocky Mountain Fresh"]
    assert_equal expected, market.vendor_names
    market.add_vendor(vendor_2)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom"]
    assert_equal expected, market.vendor_names
  end
end
