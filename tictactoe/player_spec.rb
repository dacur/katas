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
end
