require './numbers.rb'

RSpec.describe Numbers do
	subject(:number) {Numbers.new}
	describe "#roman_math" do
		it "takes in an equation as a string and converts the numbers to integers" do
			# expect(number).to receive(:unromanize)
			number.roman_math("X + X")
			expect(number.equation).to eq("10+10")
		end
		it "selects the numbers out of the equation" do
			# expect(number).to receive(:unromanize)
			number.roman_math("X + X")
			expect(number.values).to eq(["X", "X"])
		end
		it "selects the operators out of the equation" do
			# expect(number).to receive(:unromanize)
			number.roman_math("X + X - X")
			expect(number.operators).to eq(["+", "-"])
		end
		it "does the math" do
			expect(number.roman_math("X + X")).to eq(20)
		end
	end

	describe "#unromanize" do
		it "takes a Roman Numeral and returns the equivalent integer" do
			expect(number.unromanize("I")).to equal(1) 
		end
	end

end
