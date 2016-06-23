require "exam/version"

class Plateau

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x  
    @y = y
  end

  def available_position?(x, y)
    (x >= 0 && x <= @x) && (y >= 0 && y <= @y)
  end

end