class Wine
  ECONOMY = 0
  POPULAR = 1
  PREMIUM = 2
  SUPER_PREMIUM = 3
  ULTRA_PREMIUM = 4
  LUXURY = 5
 
  attr_reader :wine_name
  attr_accessor :wine_price_code
 
  def initialize(name, price_code)
    @wine_name, @wine_price_code = name, price_code
  end
end