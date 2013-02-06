module Wineshop
  class Customer
    attr_reader :name
    attr_reader :shipping_address

    def initialize(name, shipping_address)
      @name = name
      @shipping_address = shipping_address
      @balance = 0
    end

    def add_purchase(arg)
      @purchases = [] unless @purchases
      @purchases << arg
    end

    def pay(arg)
      @balance -= arg
    end

    def statement 
      total_amount = 0
      result = "Statement for #{@name}\n"
      @purchases.each do |purchase|
        this_amount = 0

        # determine amounts for each wine
        this_amount += purchase.determine_wine_amount

        # show figures for this wine
        result += "\t" + purchase.wine.wine_name + "\t" + this_amount.to_s + "\n"
        total_amount += this_amount

        unless purchase.added_to_bill
          @balance += this_amount
          purchase.added_to_bill = true
        end
      end

      # add footer lines
      result += "Total Amount is #{total_amount.to_s}\n"
      result += "Balance Owing is #{@balance.to_s}\n"
      result
    end

  end
end
