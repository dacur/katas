class Game
	require './board.rb'
	attr_accessor :board

	def board 
		Board.new
	end

end

