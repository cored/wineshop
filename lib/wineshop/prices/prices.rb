require 'ostruct'

module Wineshop
  module Prices
    Economy = OpenStruct.new(:price => 3)
    Popular = OpenStruct.new(:price => 7)
    Premium = OpenStruct.new(:price => 10)
    SuperPremium = OpenStruct.new(:price => 12)
    UltraPremium = OpenStruct.new(:price => 14)
    Luxury = OpenStruct.new(:price => 17)
  end
end
