class Cell
  def initialize(state, neighbours)
    @state = state # either 1 or 0 for alive or dead
    @neighbours = neighbours # an array that represents the surrounding cells
  end

  def regenerate
  	array_neighbours_live = @neighbours.select { |num|  num == 1  }
    if array_neighbours_live.size < 2
    	0
    elsif array_neighbours_live.size == 2 && @state == 1
    	1
    elsif array_neighbours_live.size == 3
    	1
    elsif array_neighbours_live.size > 3
    	0
    else
    	0
    end
  end
end