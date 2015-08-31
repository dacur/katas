require './board.rb'

RSpec.describe Board do 
	subject(:board) {Board.new}
	describe "#positions" do
		it "returns an array of numbers that represent the board" do
			expect(board.positions).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
		end
	end
	describe "#show" do
		it "takes in an array of positions and uses them to print out the board to the console" do
			expect(board.show([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq("1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9")
		end
	end
	describe "#preferred_spaces" do
		it "stores the preferred spaces" do
			expect(board.preferred_spaces).to eq([5,1,3,7,9,2,4,6,8])
		end
	end
	describe "#winning_moves" do
		it "stores the winning moves in tic tac toe" do
			expect(board.winning_moves).to eq([[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], 
			[1,5,9], [3,5,7]])
		end
	end
end

