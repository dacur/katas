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
	end
end
