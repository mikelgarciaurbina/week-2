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

  describe '#initialize_array' do
    it "array initialize" do
      grid = Grid.new(5,5)
      grid.array_grid = [[0,0,0],[0,1,1],[1,0,1]]
      expect(grid.get_neighbours(1, 1)).to eq([0,0,0,0,1,1,0,1])
    end
  end

end