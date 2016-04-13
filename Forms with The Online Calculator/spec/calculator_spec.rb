require File.expand_path '../spec_helper', __FILE__
require File.expand_path '../../lib/calculator.rb', __FILE__

describe "The online calculator app" do
	it "sum numbers" do
		num1 = rand(1000)
		num2 = rand(1000)
		expect(Calculator.sum(num1,num2)).to eq(num1 + num2)
	end

	it 'subtract numbers' do
		num1 = rand(1000)
		num2 = rand(1000)
		expect(Calculator.subtract(num1,num2)).to eq(num1 - num2)
	end

	it 'multiply numbers' do
		num1 = rand(1000)
		num2 = rand(1000)
		expect(Calculator.multiply(num1,num2)).to eq(num1 * num2)
	end

	it 'divide numbers' do
		num1 = rand(1000)
		num2 = rand(1000)
		expect(Calculator.divide(num1,num2)).to eq(num1 / num2)
	end
end