class Game
	require './board.rb'
	require './player.rb'
	attr_reader :order

	def initialize
		@board = Board.new
		@player = Player.new
		order
		# first_turn
	end

	def first_turn
		if @order == "y"
			player_turn
		elsif @order == "n"
			robot_turn
		else
			@order = @player.set_order
			first_turn
		end
	end

	# def player_turn
	# 	positions = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
	# 	p "Please enter a number between 1 and 9."
	# 	choice = gets.chomp.to_i
	# 	if positions.include? choice
	# 		check_availability(choice)
	# 	else
	# 		p "Please try again"
	# 		player_turn
	# 	end
	# end

	# def check_availability(choice)
	# 	"yo"
	# end

	# def robot_turn
	# 	"here too"
	# end

	def order
		true
		# @player.set_order
	end

	def board 
		@board.positions
	end

	def player
		@player
	end

end

