class Numbers
	attr_accessor :romanize

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

end