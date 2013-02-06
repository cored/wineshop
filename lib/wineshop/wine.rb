require 'ostruct'

module Wineshop
  class Wine
    ECONOMY = 0
    POPULAR = 1
    PREMIUM = 2
    SUPER_PREMIUM = 3
    ULTRA_PREMIUM = 4
    LUXURY = 5
    EconomyPrice = OpenStruct.new(:price => 3)

    attr_reader :wine_name

    def initialize(name, price = EconomyPrice)
      @wine_name, @price = name, price
    end

    def calculate_amount
      @price.price
    end
  end

end
