RSpec.describe "Rover" do

  let(:plateau)  { Exam::Plateau.new(5, 5) }
  let(:rover1)   { Exam::Rover.new("Rover 1", 1, 2, "N", plateau) }

  subject { rover }

  it "should have initializer values" do
    expect(rover1.orientation).to  eq("N")
    expect(rover1.x).to            eq(1)
    expect(rover1.y).to            eq(2)
  end

  describe "receive" do

    let(:rover2)   { Exam::Rover.new("Rover 2", 3, 3, "E", plateau) }

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