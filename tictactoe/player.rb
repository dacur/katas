class Player
	attr_reader :order

	def initialize
		get_order
	end

	def get_order
		p "Would you like to go first (y/n)?"
		@order = gets.chomp.downcase
		check_order
	end

	def check_order
		"hello"
		# if @order == "y"
		# 	@order = true
		# elsif @order == "n"
		# 	@order = false
		# else
		# 	get_order
		# end
	end

	def order
		@order
	end
end



