class Game
	require './board.rb'
	require './player.rb'
	# attr_accessor :board

	def initialize
		@board = Board.new
		@player = Player.new
		@player.set_order
	end

	def board 
		@board.positions
	end

	def player
		@player
	end

end

