module Wineshop
  class Wine

    def initialize(attr = {})
      @name, @price = attr[:name], attr[:price_code]
    end

    def calculate_amount
      @price.price
    end

    def to_s
      "#{@name}"
    end
  end

end
