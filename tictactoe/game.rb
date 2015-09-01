class Game
	require './board.rb'
	require './player.rb'
	require 'byebug'
	attr_reader :board, :player, :winning_moves, :robot_moves, :player_moves, 
		:robot_turn, :player_turn
	attr_writer :order
	attr_accessor :current_board, :choice, :current_player

	#########################################################
	#  REMEMBER TO SUBTRACT 1 FROM THE ARRAY SINCE IT'S NUMBERED 1-9  #
	#########################################################

	def initialize
		@board = Board.new
		@player = Player.new
		@current_board = @board.positions
		@winning_moves = @board.winning_moves
		@player_moves = []
		@robot_moves = []
		@preferred_spaces = @board.preferred_spaces
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
		robot_turn unless game_over?
	end

	def game_over?
		over = false
		@winning_moves.each do |move|
			if [ @current_board[move[0]-1],@current_board[move[1]-1], 
				@current_board[move[2]-1] ].uniq.count == 1
				end_game_message
				over = true
			end
		end
		over
	end

	def end_game_message
		"Congratulations #{@current_player}, you won!"
	end

	def robot_turn
		#loop through winning combos and see if player moves contains 2 of 3. if so, play 3rd space.  if not, play 1st preferred space available.
		# byebug
		@choice = nil
		
		#if robot can win, it will do so.
		@winning_moves.each do |wc|
			@remainder = wc - @robot_moves
			if @remainder.size == 1 && @current_board.include?(@remainder[0])
				@choice = @remainder[0]
				break
			end
		end

		#if not and player can win, it will block player.
		if @choice == nil
			@winning_moves.each do |wc|
				@remainder = wc - @player_moves
				if @remainder.size == 1 && @current_board.include?(@remainder[0])
					@choice = @remainder[0]
					break
				end
			end
		end
		#if neither are true, robot will play next best move.
		if @choice == nil
			preferred_remaining = @preferred_spaces - (@player_moves + @robot_moves)
			@choice = preferred_remaining[0]
		end
		
		@current_board[@choice-1] = "O"
		p "I choose space #{@choice}.\n"
		@robot_moves.push(@choice.to_i)
		unless game_over?
			@current_player = "player"
			player_turn
		end
	end

	def order
		@player.get_order
	end



end

