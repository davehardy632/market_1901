require 'pry'

class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.sum do |key, value|
      value
    end
  end

  def stock(item, number)
    @inventory[item] += number
  end
end
