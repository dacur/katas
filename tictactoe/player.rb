class Player
	# attr_accessor :order

	def order
		p "Would you like to go first (y/n)?"
		@order = gets.chomp
	end
end