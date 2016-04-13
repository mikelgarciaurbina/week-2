require File.expand_path '../spec_helper', __FILE__

describe "The online calculator app" do
	it "sum numbers" do
		num1 = 10
		num2 = 5
		params = {
			:first_number => num1,
			:second_number => num2,
			"operation" => "+"
		}
		post "/result", params
		expect(last_response.body).to include((num1.to_f + num2.to_f).to_s)
	end

	it "subtract numbers" do
		num1 = 10
		num2 = 5
		params = {
			:first_number => num1,
			:second_number => num2,
			"operation" => "-"
		}
		post "/result", params
		expect(last_response.body).to include((num1.to_f - num2.to_f).to_s)
	end

	it "multiply numbers" do
		num1 = 10
		num2 = 5
		params = {
			:first_number => num1,
			:second_number => num2,
			"operation" => "*"
		}
		post "/result", params
		expect(last_response.body).to include((num1.to_f * num2.to_f).to_s)
	end

	it "divide numbers" do
		num1 = 10
		num2 = 5
		params = {
			:first_number => num1,
			:second_number => num2,
			"operation" => "/"
		}
		post "/result", params
		expect(last_response.body).to include((num1.to_f / num2.to_f).to_s)
	end
end