require 'ostruct'

module Wineshop
  class Wine
    EconomyPrice = OpenStruct.new(:price => 3)
    PopularPrice = OpenStruct.new(:price => 7)
    PremiumPrice = OpenStruct.new(:price => 10)
    SuperPremiumPrice = OpenStruct.new(:price => 12)
    UltraPremiumPrice = OpenStruct.new(:price => 14)
    LuxuryPrice = OpenStruct.new(:price => 17)

    attr_reader :name

    def initialize(name, price = EconomyPrice)
      @name, @price = name, price
    end

    def calculate_amount
      @price.price
    end
  end

end
