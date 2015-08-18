require './board.rb'

RSpec.describe Board do 
	subject(:board) {Board.new}
	describe "#show" do
		it "shows the board on the screen" do
			expect(board.show).to eq("0 | 1 | 2")
		end
	end

end
