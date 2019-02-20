require 'pry'

class Market
  attr_reader :name,
              :vendors
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
    vendors = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendors << vendor
      end
    end
    vendors
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
          items << key
      end
    end
    items.sort.uniq
  end

  def total_inventory
    hash = Hash.new {|hash, key| hash[key] = []}
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
        hash[key] << value
        end
      end
      hash
    end

    def total_inventory_helper
      new_hash = total_inventory.each do |key, value|
        total_inventory[key] = value.sum
      end
      new_hash
      binding.pry
    end
  end
