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
		p "Please enter a number between 1 and 9."
		choice = gets.chomp.to_i
	end

	def robot_turn
		"here too"
	end
end



