class MarsControlSystem
  def initialize
    @rover_positions = []
  end

  def get_instructions(inputs)
    bounds = inputs.shift.split(" ").map(&:to_i) #our boundary
    rover_inputs = inputs.each_slice(2)

    find_all_rover_positions(rover_inputs) # placeing all the other rover positions in place

    rover_inputs.map do |position, actions|
      position = position.split(" ")
      actions = actions.split("")

      rover = Rover.new(*position) #initalize our rover

      actions.each do |action|
        validate_rover_is_in_bounds(bounds, rover.position)
        rover.perform(action) # perform actions on our rover
      end

      rover.position.join(" ") # return our rovers position
    end
  end

  private

  def find_all_rover_positions(rover_inputs)
    rover_inputs.map do |position, actions|
      pos = position.split(" ")
      @rover_positions << [pos[0], pos[1]]
    end
  end

  def validate_rover_is_in_bounds(bounds, position)
    if position[0] > bounds[0] || position[1] > bounds[1]
      raise "Rover is out of bounds."
    end
  end
end

class Rover
  #has its positions
  # when given an action it know what to do
  # adusts to give
  attr_reader :x, :y, :direction

  def initialize(x, y, direction)
    @x = x.to_i
    @y = y.to_i
    @direction = direction
  end

  def perform(action)
    if action == "M"
      move
    else
      change_direction(action)
    end
  end

  def position
    [x, y, direction]
  end

  private

  def move
    if direction == "N"
      @y += 1
    elsif direction == "S"
      @y -= 1
    elsif direction == "E"
      @x += 1
    elsif direction == "W"
      @x -= 1
    end
  end

  def change_direction(rotation)
    right_rotation = {
      "N": "E",
      "E": "S",
      "S": "W",
      "W": "N",
    }

    left_rotation = {
      "N": "W",
      "W": "S",
      "S": "E",
      "E": "N",
    }

    if rotation == "R"
      @direction = right_rotation[direction.to_sym]
    else
      @direction = left_rotation[direction.to_sym]
    end
  end
end
