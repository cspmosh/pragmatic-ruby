require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game 
  def initialize(name)
    @name = name
    @players = []
  end

  def load_players(filename)
    File.readlines(filename).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def save_high_scores(filename='high_scores.txt')
    File.open(filename, "w") do |file|
      file.puts "\n#{@name} High Scores:"
      @players.sort.each do |p|
        file.puts high_score_entry(p)
      end
    end
  end

  def high_score_entry(player)
    "#{player.name.ljust(20, '.')} (#{player.score})"
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@name}:"

    @players.each do |player|
      puts player
    end

    puts "\nThere are #{TreasureTrove::TREASURES.length} treasures to be found:"
    TreasureTrove::TREASURES.each do |t|
      puts "A #{t.name} is worth #{t.points} points"
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }

    puts "\n#{@name} Statistics:"

    puts "\n#{strong.length} strong players:"
    strong.each do |p|
      print_name_and_health(p)
    end

    puts "\n#{wimpy.length} wimpy players:"
    wimpy.each do |p|
      print_name_and_health(p)
    end

    puts "\n#{@name} High Scores:"
    @players.sort.each do |p|
      puts high_score_entry(p)
    end
 
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
  end
end