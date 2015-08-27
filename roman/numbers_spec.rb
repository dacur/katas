require './numbers.rb'

RSpec.describe Numbers do
	subject(:number) {Numbers.new}
	describe "#romanize" do
		it "converts 1 to I" do
			expect(number.romanize(1)).to eq("I")
		end
		it "converts 2 to II" do
			expect(number.romanize(2)).to eq("II")
		end
		it "converts 4 to IV" do
			expect(number.romanize(4)).to eq("IV")
		end
		it "converts 9 to IX" do
			expect(number.romanize(9)).to eq("IX")
		end
		it "converts 18 to XVIII" do
			expect(number.romanize(18)).to eq("XVIII")
		end
		it "converts 37 to XXXVII" do
			expect(number.romanize(37)).to eq("XXXVII")
		end
		it "converts 75 to LXXV" do
			expect(number.romanize(75)).to eq("LXXV")
		end
		it "converts 225 to CCXXV" do
			expect(number.romanize(225)).to eq("CCXXV")
		end
	end
end
