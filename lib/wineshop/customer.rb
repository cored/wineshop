module Wineshop
  class CustomerPresenter
    def initialize(customer)
      @customer = customer
    end

    def header
      "Statement for #{@customer.name}\n"
    end

    def footer
      "Total Amount is #{@customer.purchases_total_amount.to_s}\nBalance Owing is #{@customer.calculate_balance}\n"
    end

    def body
      body = ""
      @customer.purchases_items.each do |purchase|
        body += "\t#{purchase.item.name}\t#{purchase.determine_amount}\n"
      end
      body
    end

    def to_s
      "#{header}#{body}#{footer}"
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
      CustomerPresenter.new(self).to_s
    end

    def purchases_items
      @purchases.items
    end

    def calculate_balance
      @purchases.items.inject(0) { |balance, item| balance += item.calculate_balance }
    end

    def purchases_total_amount
      @purchases.total_amount
    end
  end
end
