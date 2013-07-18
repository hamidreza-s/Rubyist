class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
	# YOUR CODE HERE
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	acceptable_strategy = ['r', 'p', 's']
	game.each do |player|
		player_name, player_strategy = player 
		unless acceptable_strategy.include?(player_strategy.downcase)
			raise NoSuchStrategyError
		end
	end
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
end
