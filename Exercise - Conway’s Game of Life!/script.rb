require_relative './grid.rb'
require_relative './cell.rb'

require 'pry'

grid = Grid.new(5,5)

new_array = []

print grid.array_grid

grid.array_grid.each_with_index do |column, index|
	new_array[index] = []
	column.each_with_index do |line, i|
		neighbours_array_line = grid.get_neighbours(index,i)
		cell = Cell.new(line, neighbours_array_line)
		new_array[index][i] = cell.regenerate
	end
end
puts ""
print new_array
puts ""