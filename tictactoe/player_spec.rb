require './player.rb'

RSpec.describe Player do 
	subject(:player) {Player.new}

	describe "#get_order" do
		it "asks player if he or she wants to go first" do
			expect(player).to receive(:p).with("Would you like to go first (y/n)?")
			allow(player).to receive(:gets) {"y"}
			expect(player).to receive(:check_order)
			player.get_order
		end
	end

	describe "#check_order" do
		context "when the player has typed y" do 
			it "returns order as true" do
				allow(player).to receive(:player_first) {"y"}
				player.check_order
				allow(player).to receive(:player_first).and_call_original
				expect(player.player_first).to eq(true)
			end
		end
		context "when the player has typed n" do
			it "returns order as false" do
				allow(player).to receive(:player_first) {"n"}
				player.check_order
				allow(player).to receive(:player_first).and_call_original
				expect(player.player_first).to eq(false)
			end
		end
		context "when the player has typed q" do
			it "asks the player if they want to go first" do
				allow(player).to receive(:player_first) {"q"}
				allow(player).to receive(:gets) {"y"}
				expect(player).to receive(:get_order)
				player.check_order
			end
		end
	end

end
