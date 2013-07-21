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
	temp_item = []
	grouped_flatten = []
	ungrouped_flatten = tournament.flatten	
	ungrouped_flatten.each_with_index do |item,index|
		temp_item << item
		if index.odd?
			grouped_flatten << temp_item
			temp_item = []
		end
	end
	
	begin
		result = []
		while grouped_flatten.length > 1
			first, second = grouped_flatten.pop(2)
			result << rps_result(first, second)
		end
		grouped_flatten = result
	end while grouped_flatten.length > 1
	grouped_flatten.first
end

game = [["Armando", "R"], ["Dave", "S"]]
mid = 
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

big = 
[
	[
		[
			[["Armando", "P"], ["Dave", "S"]],
			[["Richard", "R"],  ["Michael", "S"]],
		],
		[
			[["Armando", "P"], ["Dave", "S"]],
			[["Richard", "R"],  ["Michael", "S"]],
		]
	],
	[
		[		
			[["Allen", "S"], ["Omer", "P"]],
			[["David E.", "R"], ["Richard X.", "P"]]
		],
		[		
			[["Allen", "S"], ["Omer", "P"]],
			[["David E.", "R"], ["Richard X.", "P"]]
		]	
	]
]

game_winner = rps_game_winner(game)
tournament_winner_small = rps_tournament_winner(game)
tournament_winner_mid = rps_tournament_winner(mid)
tournament_winner_big = rps_tournament_winner(big)

puts game_winner.inspect
puts tournament_winner_small.inspect
puts tournament_winner_mid.inspect
puts tournament_winner_big.inspect
