class Board 

	def positions
		[1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	def show(board)
		built = [board[0], " | ", board[1], " | ", board[2]]
		string_board = ""
		built.each do |b|
			string_board += b.to_s
		end

		p string_board
	end
end
