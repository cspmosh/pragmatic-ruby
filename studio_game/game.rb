require_relative 'die'

class Game 
  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in #{@name}:"
    @players.each do |p|
      puts p
    end

    @die = Die.new

    @players.each do |p|
      @roll = @die.roll
      case @roll
      when 1..2 
        p.blam
      when 4..6 
        p.w00t
      else
        puts "#{p.name} was skipped."
      end
      puts p
    end

  end
end