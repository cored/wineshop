module Wineshop
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

  end
end
