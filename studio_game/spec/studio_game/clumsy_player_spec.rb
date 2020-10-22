require 'studio_game/clumsy_player'
require 'studio_game/treasure_trove'

module StudioGame
  describe ClumsyPlayer do
    it "gets half the total treasure point value" do
      @player = ClumsyPlayer.new('clumsy', 100)
      treasure = Treasure.new('hammer', 50)
      @player.found_treasure(treasure)
      @player.found_treasure(treasure)
      @player.found_treasure(treasure)
      treasure = Treasure.new('crowbar', 400)
      @player.found_treasure(treasure)
      expect(@player.points).to eq(275)
    end
  end
end