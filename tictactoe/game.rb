class Game
	require './board.rb'
	# attr_accessor :board

	def initialize
		@board = Board.new
	end

	def board 
		@board.positions
	end

end

