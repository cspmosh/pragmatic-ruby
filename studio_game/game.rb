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

    @players.each do |p|
      p.blam
      p.w00t
      p.w00t
      puts p
    end

  end
end