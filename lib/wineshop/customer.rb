module Wineshop
  class Customer
    def initialize(name, shipping_address)
      @name = name
      @shipping_address = shipping_address
      @balance = 0
      @purchases = Purchases.new
    end

    def add_purchase(arg)
      @purchases.add arg
    end

    def pay(arg)
      @balance -= arg
    end

    def statement 
      CustomerPresenter.new(self).to_s
    end

    def purchases_items
      @purchases.items
    end

    def calculate_balance
      @purchases.total_balance  
    end

    def purchases_amount
      @purchases.total_amount
    end

    def to_s
      "#{@name}"
    end
  end
end
