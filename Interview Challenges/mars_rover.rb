class Map
  attr_accessor :x_bound, :y_bound
  def initialize(string)
    x_bound, y_bound = string.split(" ")
    @x_bound = x_bound.to_i
    @y_bound = y_bound.to_i
  end

  def print_rover_position(rover)
    puts "Rover is at position (#{rover.x}, #{rover.y}) with the current heading #{rover.heading}"
  end
end

class Rover
  attr_accessor :x, :y, :heading
  def initialize(string)
    x, y, heading = string.split(" ")
    @x = x.to_i
    @y = y.to_i
    @heading = heading
  end

  def directions(string)
    string.chars.each do |char|
      if char == "L"
        self.turn_left
      elsif char == "R"
        self.turn_right
      else # char == "M"
        self.go_straight
      end
    end
  end

  def go_straight
    if @heading == "N"
      @y += 1
    elsif @heading == "E"
      @x += 1
    elsif @heading == "S"
      @y -= 1
    else # @heading == "W"
      @x -= 1
    end
  end

  def turn_left
    if @heading == "N"
      @heading = "W"
    elsif @heading == "E"
      @heading = "N"
    elsif @heading == "S"
      @heading = "E"
    else # @heading == "W"
      @heading = "S"
    end
  end

  def turn_right
    if @heading == "N"
      @heading = "E"
    elsif @heading == "E"
      @heading = "S"
    elsif @heading == "S"
      @heading = "W"
    else # @heading == "W"
      @heading = "N"
    end
  end

end

map = Map.new("5 5")
rover1 = Rover.new("1 2 N")
rover2 = Rover.new("3 3 E")
rover1.directions("LMLMLMLMM")
rover2.directions("MMRMMRMRRM")
map.print_rover_position(rover1)
map.print_rover_position(rover2)

# OUTPUT:

# Rover is at position (1, 3) with the current heading N
# Rover is at position (5, 1) with the current heading E
