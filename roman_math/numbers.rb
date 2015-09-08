class Numbers
	attr_reader :values, :operators, :evaluate_equation
	attr_accessor :equation 

	def roman_math(equation)
		@equation = equation.split(" ")
		@values = @equation.select.each_with_index { |_, i| i.even? }
		@operators = @equation.select.each_with_index { |_, i| i.odd? }
		unromanized_values = @values.map{ |x| unromanize(x)}	
		
		@equation.each_with_index do |val, index|  
			if index.even?
				@equation[index] = unromanized_values.shift
			end
		end
		evaluate_equation
	end

	def unromanize(roman_numeral)
		rn = {"I" => 1, "II" => 2, "III" => 3, "IV" => 4, "V" => 5, "VI" => 6, 
			"VII" => 7, "VIII" => 8, "IX" => 9, "X" => 10, "L" => 50}
		rn[roman_numeral]
	end

	def evaluate_equation
		while @equation.include? "*" do
			op = @equation.index("*") 
			newval = @equation[op-1].send(@equation[op], @equation[op+1])
			@equation[op] = newval
			@equation.slice!(op-1)
			@equation.slice!(op)
		end
		while @equation.include? "/" do
			op = @equation.index("/") 
			newval = @equation[op-1].send(@equation[op], @equation[op+1])
			@equation[op] = newval
			@equation.slice!(op-1)
			@equation.slice!(op)
		end
		while @equation.include? "-" do
			op = @equation.index("-") 
			newval = @equation[op-1].send(@equation[op], @equation[op+1])
			@equation[op] = newval
			@equation.slice!(op-1)
			@equation.slice!(op)
		end
		while @equation.include? "+" do
			op = @equation.index("+") 
			newval = @equation[op-1].send(@equation[op], @equation[op+1])
			@equation[op] = newval
			@equation.slice!(op-1)
			@equation.slice!(op)
		end
		@equation = @equation[0]
	end

end






