require './numbers.rb'

RSpec.describe Numbers do
	subject(:number) {Numbers.new}
	describe "#roman_math" do
		it "selects the numbers out of the equation" do
			number.roman_math("X + X")
			expect(number.values).to eq(["X", "X"])
		end
		it "selects the operators out of the equation" do
			number.roman_math("X + X - X")
			expect(number.operators).to eq(["+", "-"])
		end
		it "does the math" do
			number.roman_math("X + X")
			expect(number.equation).to eq(20)
		end
		it "does more math" do
			number.roman_math("X + X * IV")
			expect(number.equation).to eq(50)
		end
		it "does more math" do
			number.roman_math("X * X / II")
			expect(number.equation).to eq(50)
		end
		it "does more math" do
			number.roman_math("X + X * IV - III")
			expect(number.equation).to eq(47)
		end
		it "does more math" do
			number.roman_math("X * X * II")
			expect(number.equation).to eq(200)
		end
		it "does more math" do
			number.roman_math("L / V")
			expect(number.equation).to eq(10)
		end
	end

	describe "#unromanize" do
		it "takes a Roman Numeral and returns the equivalent integer" do
			expect(number.unromanize("I")).to equal(1) 
		end
	end

	describe "#evaluate_equation" do
		it "takes an equation as an array and evaluates the equation" do
			# allow(number).to receive(:equation).with([1, "*", 3])
			number.equation = [1, "*", 3]
			number.evaluate_equation
			expect(number.equation).to eq(3)
		end
		it "takes an equation as an array and evaluates the equation" do
			# allow(number).to receive(:equation).with([1, "*", 3])
			number.equation = [1, "+", 3, "+", 9]
			number.evaluate_equation
			expect(number.equation).to eq(13)
		end
	end

end
