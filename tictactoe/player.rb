class Player
	attr_reader :order
	attr_reader :set_order

	def set_order
		p "Would you like to go first (y/n)?"
		@order = gets.chomp.downcase
	end

	def order
		@order
	end
end



