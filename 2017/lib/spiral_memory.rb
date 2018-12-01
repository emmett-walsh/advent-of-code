class SpiralMemory
  def initialize
    @current_coordinates = [0,0]
    @spiral_directions = [:south, :east, :north, :west]
    @values = Hash.new(0)
    @values.merge!({ @current_coordinates => 1 })  
  end

  def steps_to_access_port(memory_address)
    return current_x_coordinate.abs + current_y_coordinate.abs if memory_address == 1
    allocate_memory
    steps_to_access_port(memory_address - 1)
  end

  def find_first_value_larger_than(threshold)
    return @values[@current_coordinates] if @values[@current_coordinates] > threshold
    store_value
    find_first_value_larger_than(threshold)
  end

  private

  def store_value
    allocate_memory
    @values.merge!({ @current_coordinates => sum_of_adjacent_memory })
  end

  def sum_of_adjacent_memory
    @values[coordinates_to_east] +
    @values[coordinates_to_west] +
    @values[coordinates_to_north] +
    @values[coordinates_to_south] +
    @values[coordinates_to_north_east] +
    @values[coordinates_to_north_west] +
    @values[coordinates_to_south_east] +
    @values[coordinates_to_south_west]
  end

  def allocate_memory
    coordinates_to_left_are_free? ? allocate_memory_to_the_left : allocate_memory_straight_on
  end

  def coordinates_to_left_are_free?
    case current_direction
    when :north
      return current_x_coordinate == current_y_coordinate
    when :west
      return - current_x_coordinate == current_y_coordinate
    when :south
      return current_x_coordinate == current_y_coordinate
    when :east
      return 1 - current_x_coordinate == current_y_coordinate
    end
  end

  def allocate_memory_to_the_left
    turn_left
    allocate_memory_straight_on
  end

  def turn_left
    @spiral_directions.push(@spiral_directions.shift)
  end

  def allocate_memory_straight_on
    case current_direction
    when :south
      @current_coordinates = coordinates_to_south
    when :east
      @current_coordinates = coordinates_to_east
    when :north
      @current_coordinates = coordinates_to_north
    when :west
      @current_coordinates = coordinates_to_west
    end
  end

  def current_direction
    @spiral_directions.first
  end

  def coordinates_to_south
    [current_x_coordinate, current_y_coordinate - 1]
  end

  def coordinates_to_east
    [current_x_coordinate + 1, current_y_coordinate]
  end

  def coordinates_to_north
    [current_x_coordinate, current_y_coordinate + 1]
  end

  def coordinates_to_west
    [current_x_coordinate - 1, current_y_coordinate]
  end

  def coordinates_to_north_east
    [current_x_coordinate + 1, current_y_coordinate + 1]
  end

  def coordinates_to_north_west
    [current_x_coordinate - 1, current_y_coordinate + 1]
  end

  def coordinates_to_south_east
    [current_x_coordinate + 1, current_y_coordinate - 1]
  end

  def coordinates_to_south_west
    [current_x_coordinate - 1, current_y_coordinate - 1]
  end

  def current_x_coordinate
    @current_coordinates[0]
  end

  def current_y_coordinate
    @current_coordinates[1]
  end
end
