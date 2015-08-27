require './numbers.rb'

RSpec.describe Numbers do
	subject(:number) {Numbers.new}
	describe "#romanize" do
		it "take an integer and returns a roman numeral" do
			number.romanize(1)
			expect(number.romanize).to eq("I")
		end
	end
end
