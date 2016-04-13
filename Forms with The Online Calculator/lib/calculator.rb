class Calculator
	def self.make_operation(operation, num1, num2)
		case operation
		when "+"
		  self.sum(num1, num2)
		when "-"
			self.subtract(num1, num2)
		when "*"
			self.multiply(num1, num2)
		when "/"
			self.divide(num1, num2)
		end
	end

	def self.sum(num1, num2)
		num1 + num2
	end

	def self.subtract(num1, num2)
		num1 - num2
	end

	def self.multiply(num1, num2)
		num1 * num2
	end

	def self.divide(num1, num2)
		num1 / num2
	end

	def self.save_in_file(result)
		result_file = File.open("./public/result.txt", "w")
		result_file.puts result
		result_file.close
	end

	def self.load_result()
		result_file = File.open("./public/result.txt", "r+")
		preview_result = result_file.read
		result_file.close
		preview_result.to_f
	end
end