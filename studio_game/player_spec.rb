require_relative 'player'

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("josh", @initial_health)
  end

  it "has a capital name" do
    expect(@player.name).to eq("Josh")
  end

  it "has an initial health" do
    expect(@player.health).to eq(@initial_health)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Josh with a health of 150 and a score of 154.")
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(@initial_health + 4)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do 
    @player.blam
    expect(@player.health).to eq(@initial_health - 10)
  end

  context "player has more than 100 health" do
    before do
      @player = Player.new("josh", 150)
    end

    it "is strong" do
      expect(@player).to be_strong
    end
  end

  context "player has less than 100 health" do
    before do
      @player = Player.new("josh", 100)
    end

    it "is not strong" do
      expect(@player).to_not be_strong
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)
  
      @players = [@player1, @player2, @player3]
    end
  
    it "is sorted by decreasing score" do
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end
end