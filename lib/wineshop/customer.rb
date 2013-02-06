module Wineshop
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

    def purchases_total_amount
      @purchases.total_amount
    end
  end
end
