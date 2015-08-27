class Player
	attr_reader :player_first, :get_order

	def get_order
		p "Would you like to go first (y/n)?"
		@player_first = gets.chomp.downcase
		check_order
	end

	def check_order
		if player_first == "y"
			@player_first = true
		elsif player_first == "n"
			@player_first = false
		else
			get_order
		end
	end

end



