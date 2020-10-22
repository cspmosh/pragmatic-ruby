require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module StudioGame
  module GameTurn
    @die = Die.new

    def self.take_turn(player)
      @roll = @die.roll
        case @roll
        when 1..2 
          player.blam
        when 4..6 
          player.w00t
        else
          puts "#{player.name} was skipped."
        end
        player.found_treasure(TreasureTrove.random)
    end
  end
end