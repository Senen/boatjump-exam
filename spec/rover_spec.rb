RSpec.describe "Rover" do

  let(:plateau)  { Plateau.new(5, 5) }
  let(:rover1)   { Rover.new("Rover 1", 1, 2, "N", plateau) }

  subject { rover }

  it "should have initializer values" do
    expect(rover1.orientation).to  eq("N")
    expect(rover1.x).to            eq(1)
    expect(rover1.y).to            eq(2)
  end

  it "should ignore wrong orders" do
    rover1.receive("ABC123")
    expect(rover1.orientation).to  eq("N")
    expect(rover1.x).to            eq(1)
    expect(rover1.y).to            eq(2)    
  end

  describe "should ignore move orders" do

    it "to the north when rover already at maximum North position" do
      rover1.y = 5
      rover1.orientation = "N"

      rover1.receive("m")
      expect(rover1.y).to eq(5)
    
    end

    it "to the east when rover already at maximum East position" do
      rover1.x = 5
      rover1.orientation = "E"

      rover1.receive("M")
      expect(rover1.x).to eq(5)
    end

    it "to the south when rover already at maximum South position" do
      rover1.y = 0
      rover1.orientation = "S"

      rover1.receive("m")
      expect(rover1.y).to eq(0)
    
    end

    it "to the west when rover already at maximum West position" do
      rover1.x = 0

      rover1.receive("m")
      expect(rover1.x).to eq(0)
    
    end            

  end  

  describe "receive" do

    let(:rover2)   { Rover.new("Rover 2", 3, 3, "E", plateau) }

    it "should receive and process each instruction" do
      rover1.receive("LMLMLMLMM")

      check_position(rover1, 1, 3, "N")
    end

    it "should receive and process each instruction" do
      rover2.receive("MMRMMRMRRM")

      check_position(rover2, 5, 1, "E")
    end        

  end

end

def check_position(rover, x, y, orientation)
  expect(rover.x).to            eq(x)
  expect(rover.y).to            eq(y)
  expect(rover.orientation).to  eq(orientation)
end