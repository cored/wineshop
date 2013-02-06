module Wineshop
  class Purchase
    attr_reader :wine 
    attr_accessor :added_to_bill

    def initialize(wine)
      @wine = wine
      @added_to_bill = false
    end

    def determine_wine_amount
      @wine.calculate_amount
    end

  end
end
