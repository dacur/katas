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
			expect(board.show([1, 2, 3])).to eq("1 | 2 | 3")
		end
	end
end
