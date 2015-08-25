require './game.rb'

RSpec.describe Game do 
	subject(:game) {Game.new}
	let(:player) {Player.new}
	# before { allow(player.set_order).to receive(:gets) {"y"} }
	describe "#new" do
		it "creates a new board" do
			expect(game.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
		end
		it "creates a new player" do
			expect(player).to be_a(Player)
		end
		it "calls order" do
			expect(game).to receive(:order)
		end

	end

	# describe "#player_turn" do
	# 	before { allow(player).to receive(:gets) {"1"} }
	# 	it "asks the player which position to play" do
	# 		expect(player).to receive(:p).with("Please enter a number between 1 and 9.")
	# 		player.player_turn
	# 	end
	# 	describe "validates user input" do
	# 		it "checks availability if it is between 1 and 9" do
	# 			expect(player).to receive(:check_availability)
	# 			player.player_turn
	# 		end
	# 		it "is invalid otherwise" do
	# 			allow(player).to receive(:gets) {"a"}
	# 			expect(player).to receive(:player_turn)
	# 		end
	# 	end
	# 	# it "fills that spot on the board"
	# end
	# describe "checks availability of a position on the board" do
	# 	it "accepts a number and checks to see if it's available to play" do
	# 		expect(player).to receive(:check_availability)
	# 	end
	# end


end