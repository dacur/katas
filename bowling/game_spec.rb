require './games.rb'
# require 'byebug'

RSpec.describe Game do
  subject(:game) { Game.new }
  describe "#roll" do
    it "adds a given roll to the total score" do
      game.roll(7)
      expect(game.score).to eq(7)
    end
    it "roll two times not equal to 10" do
      game.roll(5)
      game.roll(3)
      expect(game.score).to eq(8)
    end
    it "handles a single strike" do
      game.roll(10)
      game.roll(7)
      game.roll(0)
      expect(game.score).to eq(24)
    end
    it "handles two consecutive strikes" do
      game.roll(10)
      game.roll(10)
      game.roll(5)
      game.roll(1)
      expect(game.score).to eq(47)
    end
    ### strike works
    ### spare works
    ### another score works
  end
end