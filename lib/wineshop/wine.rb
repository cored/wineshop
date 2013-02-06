require 'ostruct'

module Wineshop
  class Wine

    def initialize(name, price = Prices::Economy)
      @name, @price = name, price
    end

    def calculate_amount
      @price.price
    end

    def to_s
      "#{@name}"
    end
  end

end
