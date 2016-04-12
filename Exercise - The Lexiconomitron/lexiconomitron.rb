class Lexiconomitron
	def eat_t(words)
		words.gsub(/[tT]/, "")
	end

	def shazam(array_words)
		[eat_t(array_words[0].reverse), eat_t(array_words[array_words.size - 1].reverse)]
	end

	def oompa_loompa(array_words)
		array_words.select{|word| word.size <= 3}.map{|word| eat_t(word)}
	end
end