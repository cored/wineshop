module Wineshop
  class CustomerPresenter
    def initialize(customer)
      @customer = customer
    end

    def header
      "Statement for #{@customer}\n"
    end

    def footer
      "Total Amount is #{@customer.purchases_amount.to_s}\nBalance Owing is #{@customer.calculate_balance}\n"
    end

    def body
      body = ""
      @customer.purchases_items.each do |purchase|
        body += "\t#{purchase.item}\t#{purchase.determine_amount}\n"
      end
      body
    end

    def to_s
      "#{header}#{body}#{footer}"
    end
  end
end
