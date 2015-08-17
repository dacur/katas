require './coin_changer.rb'

RSpec.describe CoinChanger do 
	subject(:coin_changer) {CoinChanger.new}
	describe "#make_change" do
		it "converts 145 to [25, 25, 25, 25, 25, 10, 10]" do 
			expect(coin_changer.make_change(145)).to eq([25, 25, 25, 25, 25, 10, 10])
		end	
		it "converts 100 to [25, 25, 25, 25]" do
			expect(coin_changer.make_change(100)).to eq([25, 25, 25, 25])
		end
		it "converts 75 to [25, 25, 25]" do
			expect(coin_changer.make_change(75)).to eq([25, 25, 25])
		end
		it "converts 80 to [25, 25, 25, 5]" do 
			expect(coin_changer.make_change(80)).to eq([25, 25, 25, 5])
		end
		it "converts 70 to [25, 25, 10, 10]" do
			expect(coin_changer.make_change(70)).to eq([25, 25, 10, 10])
		end
		it "converts 62 to [25, 25, 10, 1, 1]" do
			expect(coin_changer.make_change(62)).to eq([25, 25, 10, 1, 1])
		end
		it "converts 4 to [1, 1, 1, 1]" do 
			expect(coin_changer.make_change(4)).to eq([1, 1, 1, 1])
		end
		it "converts 0 to []" do 
			expect(coin_changer.make_change(0)).to eq([])
		end
	end
end