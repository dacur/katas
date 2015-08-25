class Player
	attr_reader :order
	
	def initialize
		set_order
	end

	def set_order
		p "Would you like to go first (y/n)?"
		@order = gets.chomp.downcase
	end

	def order
		@order
	end
end



