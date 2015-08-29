class Game
	require './board.rb'
	require './player.rb'
	attr_reader :board, :player, :current_board
	attr_writer :order 

	def initialize
		@board = Board.new
		@player = Player.new
		@current_board = @board.positions
	end

	def first_turn
		if order
			player_turn
		else
			robot_turn
		end
	end

	def player_turn
		positions = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
		p "Please enter a number between 1 and 9."
		choice = gets.chomp.to_i
		if positions.include? choice
			check_availability(choice)
		else
			p "Please try again"
			player_turn
		end
	end

	def check_availability(choice)
		if @board.positions.include? choice
			make_move(choice)
		else
			player_turn
		end

	end

	def make_move(choice)
		current_board[choice-1] = "X"
		check_if_winner
	end

	def check_if_winner
		"hello"
	end

	def robot_turn
		"here too"
	end

	def order
		@player.get_order
	end



end

