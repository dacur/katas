class CoinChanger
	def make_change(number)
		coins = [25, 10, 5, 1]
		change = []
		coins.each do |coin|
			number_of_coins = number/coin
			number_of_coins.times { change << coin }
			number = number % coin
		end
		change
	end
end