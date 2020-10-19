require_relative 'player'
require_relative 'game'

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")

knuckleheads.load_players(ARGV.shift || "players.csv")

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
