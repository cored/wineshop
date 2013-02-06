module Wineshop
  class Purchases
    attr_accessor :items 
    def initialize
      @items = []
    end

    def total_amount
      @items.inject(0) { |sum, item| sum += item.determine_amount }
    end

    def add(item)
      @items << item
    end

    def total_balance
      @items.inject(0) { |balance, item| balance += item.calculate_balance }
    end
  end
end
