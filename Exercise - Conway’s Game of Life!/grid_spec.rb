require 'rspec'
require_relative './grid.rb'
require 'pry'

describe Grid do 

  describe '#initialize_array' do
    it "array initialize" do
      grid = Grid.new(5,5)
      expect(grid.initialize_array).to eq(grid.array_grid)
    end
  end

  describe '#get_neighbours' do
    it "get cell neighbours" do
      grid = Grid.new(3,3)
      grid.array_grid = [[0,0,0],[0,1,1],[1,0,1]]
      expect(grid.get_neighbours(1, 1)).to eq([0,0,0,0,1,1,0,1])
    end
  end

  describe '#array_grid_end?' do
    it "return false if cell is live" do
      grid = Grid.new(3,3)
      grid.array_grid = [[0,0,0],[0,1,1],[1,0,1]]
      expect(grid.array_grid_end?).to eq(false)
    end

    it "return true if all cells are dead" do
      grid = Grid.new(3,3)
      grid.array_grid = [[0,0,0],[0,0,0],[0,0,0]]
      expect(grid.array_grid_end?).to eq(true)
    end
  end
end