class Rover

  attr_accessor :x, :y, :orientation, :plateau
  CARDINAL_POINTS = ["N", "E", "S", "W"]

  def initialize(name, x, y, orientation, plateau)
    @name         = name
    @x            = x  
    @y            = y
    @orientation  = orientation
    @plateau      = plateau
  end

  def receive(commands)
    commands.split("").each do |command|
      process(command)
    end
    # puts "#{@name} final position: #{@x}, #{@y}, #{@orientation}"
  end

  private 

    def process(command)
      case command
      when "L" then 
        rotate("L")
      when "R" then 
        rotate("R")
      when "M" then 
        move
      else 
        # puts "Unknonw command ignored: #{command}"
      end
    end

    def rotate(direction)
      if direction == "R"
        new_orientation_index = CARDINAL_POINTS.index(@orientation) + 1
      elsif direction == "L"
        new_orientation_index = CARDINAL_POINTS.index(@orientation) - 1
      end
      @orientation = CARDINAL_POINTS[new_orientation_index.modulo(4)]
    end

    def move
      case @orientation
      when "N" then
        @y = @y + 1 if able_to_move_to?(@x, @y + 1)
      when "E" then
        @x = @x + 1 if able_to_move_to?(@x + 1, @y)
      when "S" then
        @y = @y - 1 if able_to_move_to?(@x, @y - 1)
      when "W" then        
        @x = @x - 1 if able_to_move_to?(@x - 1, @y)
      end

    end 

    def able_to_move_to?(x, y)
      @plateau.available_position?(x, y)
    end       

end