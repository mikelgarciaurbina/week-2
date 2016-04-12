require_relative "calculator.rb"

RSpec.describe "String interpolator" do

	let(:calculator) {Calculator.new}

	describe ".interpolator" do

		it "Should work" do
			word = "ajdhgksadhfgkasjdhf" * rand(10000)
			expect(calculator.interpolator(word)).to eq("Hello #{word}!")
		end

		it "Should work" do
			expect(calculator.interpolator(["a", "b", "c"])).to eq("Hello a b c!")
		end

		it "Works with nil" do
			expect(calculator.interpolator(nil)).to eq("Hello whoever you are!")
		end
	end
end