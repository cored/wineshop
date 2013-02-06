module Wineshop
  class Purchases
    attr_accessor :items 
    def initialize
      @items = []
      @total_amount = 0
    end

    def total_amount
      @items.inject(0) { |sum, item| sum += item.determine_amount }
    end
  end

  class Purchase
    attr_reader :item
    attr_accessor :added_to_bill

    def initialize(item)
      @item = item
      @added_to_bill = false
    end

    def determine_amount
      @item.calculate_amount
    end

    def calculate_balance
      balance = 0
      unless added_to_bill
        added_to_bill = true
        balance += determine_amount
      end
      balance
    end
  end
end
