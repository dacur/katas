require './player.rb'

RSpec.describe Player do 
	subject(:player) {Player.new}

	describe "#set_order" do
		it "asks player if he or she wants to go first" do
			expect(player).to receive(:p).with("Would you like to go first (y/n)?")
			allow(player).to receive(:gets) {"y"}
			expect(player).to receive(:first_turn)
			player.set_order
		end
	end

	describe "#first_turn" do
		context "when the player has typed y" do 
			it "starts the player's turn" do
				allow(player).to receive(:order) {"y"}
				expect(player).to receive(:player_turn)
				player.first_turn
			end
		end
		context "when the player has typed n" do
			it "starts the robot's turn" do
				allow(player).to receive(:order) {"n"}
				expect(player).to receive(:robot_turn)
				player.first_turn
			end
		end
		context "when the player has typed q" do
			it "asks the player if they want to go first" do
				allow(player).to receive(:order) {"q"}
				expect(player).to receive(:set_order)
				player.first_turn
			end
		end
	end

	describe "#player_turn" do
		before { allow(player).to receive(:gets) {"1"} }
		it "asks the player which position to play" do
			expect(player).to receive(:p).with("Please enter a number between 1 and 9.")
			player.player_turn
		end
		describe "validates user input" do
			it "checks availability if it is between 1 and 9" do
				expect(player).to receive(:check_availability)
				player.player_turn
			end
		# 	it "is invalid otherwise" do
		# 		allow(player).to receive(:gets) {"a"}
		# 		expect(player).to receive(:player_turn)
		# 	end
		end
		# it "fills that spot on the board"
	end

end
