module Wineshop
  class Wine
    ECONOMY = 0
    POPULAR = 1
    PREMIUM = 2
    SUPER_PREMIUM = 3
    ULTRA_PREMIUM = 4
    LUXURY = 5

    attr_reader :wine_name
    attr_accessor :wine_price_code

    def initialize(name, price_code = EconomyPriceCode.new)
      @wine_name, @wine_price_code = name, price_code
    end

    def calculate_amount
      @wine_price_code.calculate_amount
    end
  end

  class EconomyPriceCode
    def initialize
      @price_code = 0
    end
  end
end
