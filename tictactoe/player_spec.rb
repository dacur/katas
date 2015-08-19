require './player.rb'

RSpec.describe Player do 
	subject(:player) {Player.new}
	describe "#order" do
		it "asks player if he or she wants to go first" do
			allow(player).to receive(:gets) {"y"}
			expect(player.order).to eq("y")
		end
	end
end
