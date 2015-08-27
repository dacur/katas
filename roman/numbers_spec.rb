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
	end
end
