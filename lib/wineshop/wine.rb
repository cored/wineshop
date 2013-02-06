require 'ostruct'

module Wineshop
  class Wine
    PREMIUM = 2
    SUPER_PREMIUM = 3
    ULTRA_PREMIUM = 4
    LUXURY = 5
    EconomyPrice = OpenStruct.new(:price => 3)
    PopularPrice = OpenStruct.new(:price => 7)
    PremiumPrice = OpenStruct.new(:price => 10)
    SuperPremiumPrice = OpenStruct.new(:price => 12)
    UltraPremiumPrice = OpenStruct.new(:price => 14)

    attr_reader :wine_name

    def initialize(name, price = EconomyPrice)
      @wine_name, @price = name, price
    end

    def calculate_amount
      @price.price
    end
  end

end
