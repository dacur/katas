class Board 
	attr_writer :positions

	def positions
		[1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	def show(board)
		line = "\n---------\n"
		built = [board[0], " | ", board[1], " | ", board[2], line, board[3], " | ", board[4], " | ", board[5], line, board[6], " | ", board[7], " | ", board[8]]
		string_board = ""
		built.each do |b|
			string_board += b.to_s
		end
		p string_board		
	end

	def winning_moves
		[[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], 
			[1,5,9], [3,5,7]]
	end
end
