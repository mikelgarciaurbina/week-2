require_relative './grid.rb'
require_relative './cell.rb'

require 'pry'

grid = Grid.new(7,7)
system "clear"
grid.show_array_grid

while grid.array_grid_end? == false
	new_array = []

	grid.array_grid.each_with_index do |column, index|
		new_array[index] = []
		column.each_with_index do |line, i|
			neighbours_array_line = grid.get_neighbours(index,i)
			cell = Cell.new(line, neighbours_array_line)
			new_array[index][i] = cell.regenerate
		end
	end

	grid.array_grid = new_array
	system "clear"
	grid.show_array_grid
	sleep(1)
end