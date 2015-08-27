require './game.rb'

RSpec.describe Game do 
	subject(:game) {Game.new}
	let(:player) {Player.new}
	let(:board) {Board.new}
	# before { allow(player.get_order).to receive(:gets) {"y"} }
	describe "#new" do
		it "creates a new board" do
			expect(game.board.positions).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
		end
		it "creates a new player" do
			expect(player).to be_a(Player)
		end
	end

	# *** CURRENTLY RETURNS NIL ***
	# describe "#order" do
	# 	before { allow(player).to receive(:gets) {"y"} }
	# 	it "asks the player if he or she wants to go first and sets order" do
	# 		expect(player.player_first).to be_truthy
	# 		expect(game.order).to be_truthy
	# 		game.order
	# 	end
	# end

	describe "#player_turn" do
		before { allow(game).to receive(:gets) {"1"} }
		it "asks the player which position to play" do
			expect(game).to receive(:p).with("Please enter a number between 1 and 9.")
			game.player_turn
		end
		# before { allow(game.player_turn).to receive(:gets) {"1"} }
		describe "validates user input" do
			it "checks availability if it is between 1 and 9" do
				allow(game).to receive(:gets){"1"}
				choice = 1
				expect(game).to receive(:check_availability){choice}
				game.player_turn
			end
			it "is invalid otherwise" do
				allow(game).to receive(:gets) {"a"}
				expect(game).to receive(:player_turn)
				game.player_turn
			end
		end
	end

	describe "#make_move" do
		it "accepts a number and changes the board to reflect the move" do
			game.make_move(1)
			expect(game.current_board).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])

		end
	end


end









