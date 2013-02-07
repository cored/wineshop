module Wineshop
  class Purchase
    attr_reader :item

    def initialize(attr = {})
      @item = attr[:item]
      @added_to_bill = attr[:added_to_bill]
    end

    def determine_amount
      @item.calculate_amount
    end

    def calculate_balance
      balance = 0
      unless @added_to_bill
        @added_to_bill = true
        balance = determine_amount
      end
      balance
    end
  end
end
