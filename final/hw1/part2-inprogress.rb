class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(first, second)
	first_player, first_strategy = first
	second_player, second_strategy = second
	case first_strategy.downcase
		when 'r'
			if second_strategy.downcase == 's' || second_strategy.downcase == 'r'
				return first
			else
				return second
			end
		when 'p'
			if second_strategy.downcase == 'r' || second_strategy.downcase == 'p'
				return first
			else
				return second
			end
		when 's'
			if second_strategy.downcase == 'p' || second_strategy.downcase == 's'
				return first
			else
				return second
			end
		else
			raise NoSuchStrategyError
	end
end

def rps_game_winner(game)
	# sanitize input
	raise WrongNumberOfPlayersError unless game.length == 2
	acceptable_strategy = ['r', 'p', 's']
	game.each do |player|
		player_name, player_strategy = player 
		unless acceptable_strategy.include?(player_strategy.downcase)
			raise NoSuchStrategyError
		end
	end
	# calculate winner
	player_1, player_2 = game
	rps_result(player_1, player_2)
end

def rps_tournament_winner(tournament)
	
	round_one = []
  tournament.each do |group|
  	results = []
  	group.each do |game|
  		results << rps_game_winner(game)
  	end
  	round_one << results
  end
  
  round_two = []
	round_one.each do |game|
		round_two << rps_game_winner(game)
	end
	
	round_final = rps_game_winner(round_two)
end

game = [["Armando", "R"], ["Dave", "S"]]
tournament = 
[
	[
		[["Armando", "P"], ["Dave", "S"]],
		[["Richard", "R"],  ["Michael", "S"]],
	],
	[
		[["Allen", "S"], ["Omer", "P"]],
		[["David E.", "R"], ["Richard X.", "P"]]
	]
]

game_winner = rps_game_winner(game)
tournament_winner = rps_tournament_winner(tournament)

puts game_winner.inspect
puts tournament_winner.inspect
