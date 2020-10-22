require 'studio_game/beserker_player'

module StudioGame
  describe BeserkerPlayer do
    before do
      @initial_health = 50
      @player = BeserkerPlayer.new('Josh', @initial_health)
    end

    it "does not go beserk when w00ted up to 5 times" do 
      1.upto(5) { @player.w00t }    
      @player.beserk?.should be_falsey
    end

    it "goes beserk when w00ted more than 5 times" do
      1.upto(6) { @player.w00t }
      @player.beserk?.should be true
    end

    it "gets w00ted instead of blammed when it's gone beserk" do
      1.upto(6) { @player.w00t }
      1.upto(2) { @player.blam }
      expect(@player.health).to eq(@initial_health + (8 * 15))
    end
  end
end