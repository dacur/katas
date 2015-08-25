require './player.rb'

RSpec.describe Player do 
	subject(:player) {Player.new}

	describe "#initialize" do
		it "calls get_order" do
			expect_any_instance_of(Player).to receive(:get_order)
			Player.new
		end
	end

	describe "#get_order" do
		it "asks player if he or she wants to go first" do
			expect(player).to receive(:p).with("Would you like to go first (y/n)?")
			allow(player).to receive(:gets) {"y"}
			expect(player).to receive(:check_order)
			player.get_order
		end
	end

	# describe "#check_order" do
	# 	context "when the player has typed y" do 
	# 		it "starts the player's turn" do
	# 			allow(:game).to receive(:order) {"y"}
	# 			expect(game).to receive(:player_turn)
	# 			game.first_turn
	# 		end
	# 	end
	# 	context "when the player has typed n" do
	# 		it "starts the robot's turn" do
	# 			allow(player).to receive(:order) {"n"}
	# 			expect(player).to receive(:robot_turn)
	# 			player.first_turn
	# 		end
	# 	end
	# 	context "when the player has typed q" do
	# 		it "asks the player if they want to go first" do
	# 			allow(player).to receive(:order) {"q"}
	# 			expect(player).to receive(:set_order)
	# 			player.first_turn
	# 		end
	# 	end
	# end

end
