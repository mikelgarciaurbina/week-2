class Calculator
	def interpolator(name)
		name ? "Hello #{[name].join(" ")}!" : "Hello whoever you are!"
	end
end