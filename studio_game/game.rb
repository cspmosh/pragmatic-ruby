require_relative 'die'
require_relative 'game_turn'

class Game 
  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@name}:"

    @players.each do |player|
      puts player
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_name_and_health(player)
    puts "#{p.name} (#{p.health})"
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
      puts "#{p.name.ljust(20, '.')} (#{p.score})"
    end
  end
end