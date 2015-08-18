require './board.rb'

RSpec.describe Board do 
	subject(:board) {Board.new}
	describe "#positions" do
		it "returns an array of numbers that represent the board" do
			expect(board.positions).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
		end
	end

end
