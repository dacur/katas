class Game
	require './board.rb'
	require './player.rb'
	attr_reader :board, :player, :winning_moves
	attr_writer :order
	attr_accessor :current_board 

	#########################################################
	#  REMEMBER TO SUBTRACT 1 FROM THE ARRAY SINCE IT'S NUMBERED 1-9  #
	#########################################################
	
	def initialize
		@board = Board.new
		@player = Player.new
		@current_board = @board.positions
		@winning_moves = @board.winning_moves
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
		@winning_moves.each do |move|
			if [ @current_board[move[0]-1],@current_board[move[1]-1], 
				@current_board[move[2]-1] ].uniq.count == 1
				game_over
			end
		end
	end

	def game_over
		"hello"
	end

	def robot_turn
		"here too"
	end

	def order
		@player.get_order
	end



end

