class Numbers
	attr_accessor :roman_math, :equation, :values, :operators, :unromanized_values
	attr_reader :unromanize

	def romanize(number)
		romans = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 50=> "L", 10 => "X", 9 => "IX", 5=> "V", 4 => "IV", 1 => "I"}
		roman_numeral = ""
		romans.each do |key, value|
			number_of_rn = number/key
			number_of_rn.times { roman_numeral += value }
			number = number % key
		end
		roman_numeral
	end

	def roman_math(equation)
		@equation = equation.split(" ")
		@values = @equation.select.each_with_index { |_, i| i.even? }
		@operators = @equation.select.each_with_index { |_, i| i.odd? }
		@unromanized_values = @values.map{ |x| unromanize(x)}
	end

	def unromanize(roman_numeral)
		rn = {"I" => 1, "II" => 2, "III" => 3, "IV" => 4, "V" => 5, "VI" => 6, 
			"VII" => 7, "VIII" => 8, "IX" => 9, "X" => 10}
		rn[roman_numeral]
	end
end