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

    def customer_statement
      total_amount = 0
      result = "Statement for #{@name}\n"
      @purchases.each do |element|
        this_amount = 0

        # determine amounts for each wine
        case element.wine.wine_price_code
        when Wine::ECONOMY
          this_amount += 3
        when Wine::POPULAR
          this_amount += 7
        when Wine::PREMIUM
          this_amount += 10
        when Wine::SUPER_PREMIUM
          this_amount += 12
        when Wine::ULTRA_PREMIUM
          this_amount += 14
        when Wine::LUXURY
          this_amount += 17
        end

        # show figures for this wine
        result += "\t" + element.wine.wine_name + "\t" + this_amount.to_s + "\n"
        total_amount += this_amount

        unless element.added_to_bill
          @balance += this_amount
          element.added_to_bill = true
        end
      end

      # add footer lines
      result += "Total Amount is #{total_amount.to_s}\n"
      result += "Balance Owing is #{@balance.to_s}\n"
      result
    end

  end
end
