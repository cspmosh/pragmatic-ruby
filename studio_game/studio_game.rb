require_relative './player.rb'

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

players = [player1, player2, player3]

puts "There are #{players.size} players in the game:"
players.each do |p|
  puts p
end
