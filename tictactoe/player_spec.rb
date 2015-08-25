require './player.rb'

RSpec.describe Player do 
	subject(:player) {Player.new}

	describe "#initialize" do
		it "calls set_order" do
			expect_any_instance_of(Player).to receive(:set_order)
			Player.new
		end
	end

	describe "#set_order" do
		it "asks player if he or she wants to go first" do
			expect(player).to receive(:p).with("Would you like to go first (y/n)?")
			allow(player).to receive(:gets) {"y"}
			# expect(player).to receive(:first_turn)
			player.set_order
		end
	end
end
