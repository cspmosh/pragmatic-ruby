require_relative 'player'
require_relative 'game'
require_relative 'clumsy_player'
require_relative 'beserker_player'

knuckleheads = Game.new("Knuckleheads")

knuckleheads.load_players(ARGV.shift || "players.csv")

clumsyPlayer = ClumsyPlayer.new("clumsy", 105)
knuckleheads.add_player(clumsyPlayer)

beserkerPlayer = BeserkerPlayer.new("beserker", 105)
knuckleheads.add_player(beserkerPlayer)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  @rounds = gets.chomp.downcase
  case @rounds
  when /^\d+$/
    knuckleheads.play(@rounds.to_i)
    knuckleheads.print_stats
  when 'quit'
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores("my_scores.txt")
