require './games.rb'
require 'byebug'
require 'pp'

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
    it "handles a spare" do
      game.roll(5)
      game.roll(5)
      game.roll(7)
      game.roll(2)
      expect(game.score).to eq(26)
    end
    context "last frame" do
      it "handles a perfect game" do
        12.times { game.roll(10) }
        expect(game.score).to eq(300)
      end
      it "handles a strike and 7" do
        11.times { game.roll(10) }
        game.roll(7)
        expect(game.score).to eq(297)
      end
      it "handles a strike and a spare" do
        10.times { game.roll(10) }
        game.roll(7)
        game.roll(3)
        expect(game.score).to eq(287)
      end
      it "handles a strike and a 7 and 2" do
        10.times { game.roll(10) }
        game.roll(7)
        game.roll(2)
        expect(game.score).to eq(286)
      end
    end
    ### strike works
    ### spare works
    ### another score works
  end
end