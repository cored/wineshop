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

  class Customer
    attr_reader :name
    attr_reader :shipping_address

    def initialize(name, shipping_address)
      @name = name
      @shipping_address = shipping_address
      @balance = 0
      @purchases = Purchases.new
    end

    def add_purchase(arg)
      @purchases.items << arg
    end

    def pay(arg)
      @balance -= arg
    end

    def statement 
      result = header
      @purchases.items.each do |purchase|
        this_amount = 0
        this_amount += purchase.determine_amount

        # show figures for this wine
        result += "\t" + purchase.item.name+ "\t" + this_amount.to_s + "\n"

        unless purchase.added_to_bill
          @balance += this_amount
          purchase.added_to_bill = true
        end
      end

      result += footer
      result
    end

    private
    def purchases_total_amount
      @purchases.total_amount
    end

    def header
      "Statement for #{@name}\n"
    end

    def footer
      "Total Amount is #{purchases_total_amount.to_s}\nBalance Owing is #{@balance.to_s}\n"
    end

  end
end
