class Grid
  attr_accessor :array_grid
  def initialize(columns, lines)
    @array_grid = []
    @columns, @lines = columns, lines
    initialize_array
  end

  def initialize_array
    @columns.times do |column|
      @array_grid[column] = []
      @lines.times do |line|
        @array_grid[column][line] = rand(2)
      end
    end
    @array_grid
  end

  def get_neighbours(index, index2)
    neighbours_array_line = []
    if index > 0 && index2 > 0 && @array_grid[index - 1] && @array_grid[index - 1][index2-1]
      neighbours_array_line << @array_grid[index - 1][index2-1]
    end
    if index > 0 && @array_grid[index - 1] && @array_grid[index - 1][index2]
      neighbours_array_line << @array_grid[index - 1][index2]
    end
    if index > 0 && @array_grid[index - 1] && @array_grid[index - 1][index2+1]
      neighbours_array_line << @array_grid[index - 1][index2+1]
    end
    if index2 > 0 && @array_grid[index] && @array_grid[index][index2-1]
      neighbours_array_line << @array_grid[index][index2-1]
    end
    if @array_grid[index] && @array_grid[index][index2+1]
      neighbours_array_line << @array_grid[index][index2+1]
    end
    if index2 > 0 && @array_grid[index + 1] && @array_grid[index + 1][index2-1]
      neighbours_array_line << @array_grid[index + 1][index2-1]
    end
    if @array_grid[index + 1] && @array_grid[index + 1][index2]
      neighbours_array_line << @array_grid[index + 1][index2]
    end
    if @array_grid[index + 1] && @array_grid[index + 1][index2+1]
      neighbours_array_line << @array_grid[index + 1][index2+1]
    end
    neighbours_array_line
  end
end