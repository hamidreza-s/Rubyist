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
			first, second = grouped_flatten.shift(2)
			result << rps_result(first, second)
		end
		grouped_flatten = result
	end while grouped_flatten.length > 1
	grouped_flatten.first
end

man_2 = [["Armando", "R"], ["Dave", "S"]]
man_8 = 
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

man_16 = 
[
	[
		[
			[["Armando1", "P"], ["Dave1", "S"]],
			[["Richard1", "R"],  ["Michael1", "S"]],
		],
		[
			[["Armando2", "P"], ["Dave2", "S"]],
			[["Richard2", "R"],  ["Michael2", "S"]],
		]
	],
	[
		[
			[["Armando3", "P"], ["Dave3", "S"]],
			[["Richard3", "R"],  ["Michael3", "S"]],
		],
		[
			[["Armando4", "P"], ["Dave4", "S"]],
			[["Richard4", "R"],  ["Michael4", "S"]],
		]
	]
]

man_32 = 
[
	[
		[
			[
				[["Armando1", "P"], ["Dave1", "S"]],
				[["Richard1", "R"],  ["Michael1", "S"]],
			],
			[
				[["Armando2", "P"], ["Dave2", "S"]],
				[["Richard2", "R"],  ["Michael2", "S"]],
			]
		],
		[
			[
				[["Armando3", "P"], ["Dave3", "S"]],
				[["Richard3", "R"],  ["Michael3", "S"]],
			],
			[
				[["Armando4", "P"], ["Dave4", "S"]],
				[["Richard4", "R"],  ["Michael4", "S"]],
			]
		]
	],
	[
		[
			[
				[["Armando5", "P"], ["Dave5", "S"]],
				[["Richard5", "R"],  ["Michael5", "S"]],
			],
			[
				[["Armando6", "P"], ["Dave6", "S"]],
				[["Richard6", "R"],  ["Michael6", "S"]],
			]
		],
		[
			[
				[["Armando7", "P"], ["Dave7", "S"]],
				[["Richard7", "R"],  ["Michael7", "S"]],
			],
			[
				[["Armando8", "P"], ["Dave8", "S"]],
				[["Richard8", "R"],  ["Michael8", "S"]],
			]
		]
	]
]

puts rps_game_winner(man_2).inspect
puts rps_tournament_winner(man_2).inspect
puts rps_tournament_winner(man_8).inspect
puts rps_tournament_winner(man_16).inspect
puts rps_tournament_winner(man_32).inspect
