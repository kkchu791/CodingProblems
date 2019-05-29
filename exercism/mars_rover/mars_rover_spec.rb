require 'rspec'
require_relative 'mars_rover'

describe 'Mars Control System Behavior' do
  before do
    @system = MarsControlSystem.new()
  end

  it 'should check if rover is in bounds' do
    expect{@system.get_instructions(["5 5", "6 0 N", "M"])}.to raise_error(RuntimeError, 'Rover is out of bounds.')
  end

  it 'should check if rover is in bounds' do
    expect{@system.get_instructions(["5 5", "4 0 E", "MMMM"])}.to raise_error(RuntimeError, 'Rover is out of bounds.')
  end

  it "should move rover 1 step up" do
    expect(@system.get_instructions(["5 5", "0 0 N", "M"])).to eq(["0 1 N"])
  end

  it "should move rover 1 step down" do
    expect(@system.get_instructions(["5 5", "0 1 S", "M"])).to eq(["0 0 S"])
  end

  it "should move rover 1 step right" do
    expect(@system.get_instructions(["5 5", "0 0 E", "M"])).to eq(["1 0 E"])
  end

  it "should move rover 1 step left" do
    expect(@system.get_instructions(["5 5", "1 0 W", "M"])).to eq(["0 0 W"])
  end

  it "will rotate 90 degress to the right and point East if current direction is North" do
    expect(@system.get_instructions(["5 5", "0 0 N", "R"])).to eq(["0 0 E"])
  end

  it "will rotate 90 degress to the right and point South if current direction is East" do
    expect(@system.get_instructions(["5 5", "0 0 E", "R"])).to eq(["0 0 S"])
  end

  it "will rotate 90 degress to the left and point West if current direction is North" do
    expect(@system.get_instructions(["5 5", "0 0 N", "L"])).to eq(["0 0 W"])
  end

  it "will rotate 90 degress to the left and point South if current direction is West" do
    expect(@system.get_instructions(["5 5", "0 0 W", "L"])).to eq(["0 0 S"])
  end

  it "will rotate 90 degress to the right and move one step" do
    expect(@system.get_instructions(["5 5", "0 0 N", "RM"])).to eq(["1 0 E"])
  end

  it "will rotate 90 degress to the left and move one step" do
    expect(@system.get_instructions(["5 5", "1 0 N", "LM"])).to eq(["0 0 W"])
  end

  it "can move in a circle and end up at the same position point at the same direction" do
    expect(@system.get_instructions(["5 5", "1 1 N", "LMLMLMLM"])).to eq(["1 1 N"])
  end

  it "can move 1 rover right and move 1 rover right" do
    expect(@system.get_instructions(["5 5", "0 0 E", "M", "3 0 E", "M"])).to eq(["1 0 E", "4 0 E"])
  end

  it "can rotate one rover and move 1 step up and rotate one rover and move 1 step left" do
    expect(@system.get_instructions(["5 5", "0 0 E", "LM", "3 0 E", "RRM"])).to eq(["0 1 N", "2 0 W"])
  end

  it "can not allow rovers to collide" do
    expect{@system.get_instructions(["5 5", "0 0 E", "M", "1 0 E", "M"])}.to raise_error(RuntimeError, 'Rovers will collide.')
  end

  it "should move one rover 1 step up" do
    expect(@system.get_instructions(["5 5", "0 0 N", "M"])).to eq(["0 1 N"])
  end
end

describe 'Mars Rover Behavior' do
  before do
    @rover = Rover.new("0", "0", "N")
  end

  it 'should should move rover when given an action' do
    @rover.perform("M")
    expect(@rover.position).to eq([0, 1, "N"])
  end

  it 'should should move rover when given an action' do
    @rover.perform("RMM")
    expect(@rover.position).to eq([2, 0, "E"])
  end
end
