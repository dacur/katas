require './game.rb'

RSpec.describe Game do 
	subject(:game) {Game.new}
	describe "#new" do
		it "creates a new board" do
			expect(game.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
		end
	end

end