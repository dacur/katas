require './game.rb'
# require 'byebug'

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

	describe "#order" do
		let(:player) {game.player}
		before { allow(player).to receive(:gets) {"y"} }
		it "asks the player if he or she wants to go first and sets order" do
			game.order
			expect(player.player_first).to be_truthy
			expect(game.order).to be_truthy
		end
	end

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
		it "checks to see if we have a winner" do
			expect(game).to receive(:check_if_winner)
			game.make_move(1)
		end
	end

	describe "#first_turn" do
		context "order is true" do 
			it "is the player's turn" do
				allow(game).to receive(:order) {true}
				expect(game).to receive(:player_turn)
				game.first_turn
			end
		end
		context "order is false" do 
			it "is the robot's turn" do
				allow(game).to receive(:order) {false}
				expect(game).to receive(:robot_turn)
				game.first_turn
			end
		end
	end

	describe "#check_if_winner" do
		it "knows the winning moves" do
			expect(game.winning_moves).to eq([[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], 
			[1,5,9], [3,5,7]])
		end
		it "checks if a player has won the game" do
			game.current_board = ["X", "X", "X", 4, 5, 6, 7, 8, 9]
			# game.check_if_winner
			expect(game).to receive(:game_over)
			game.check_if_winner
		end
	end

	describe "#robot_turn" do
		it "takes the first move and chooses the center space" do
			game.robot_turn
			expect(game.choice).to eq(5)
		end
		it "updates the current board to include the robot's choice" do
			game.robot_turn
			allow(game).to receive(:choice){5}
			expect(game.current_board).to eq([1, 2, 3, 4, "O", 6, 7, 8, 9])
		end
		it "says which space it has chosen" do
			allow(game).to receive(:choice){5}
			expect(game).to receive(:p).with("I choose space 5.\n")
			game.robot_turn
		end
		it "adds the robot's choice to robot's moves" do
			allow(game).to receive(:choice){5}
			game.robot_turn
			expect(game.robot_moves).to eq([5])
			
		end
		it "checks to see if the robot won" do
			expect(game).to receive(:check_if_winner)
			game.robot_turn
		end
		it "sets the current player at the end of the turn" do
			game.robot_turn
			expect(game.current_player).to eq("player")
		end
	end

	describe "#game_over" do
		it "Tells the current player he or she won" do
			# allow(game).to receive(:current_player){"robot"}
			game.current_player = "robot"
			game.game_over
			expect(game.game_over).to eq("Congratulations robot, you won!")
		end
	end

end

























