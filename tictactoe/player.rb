class Player
	# attr_accessor :order

	def set_order
		p "Would you like to go first (y/n)?"
		@order = gets.chomp.downcase
		first_turn
	end

	def order
		@order
	end

	def first_turn
		if order == "y"
			player_turn
		elsif order == "n"
			robot_turn
		else
			set_order
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
		"yo"
	end

	def robot_turn
		"here too"
	end
end



