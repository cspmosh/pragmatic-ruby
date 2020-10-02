require_relative 'player'
require_relative 'treasure_trove'

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
    @player.found_treasure(Treasure.new(:pie, 5))
    @player.found_treasure(Treasure.new(:bottle, 25))
    expect(@player.to_s).to eq("I'm Josh with health = 150, points = 30, and score = 180.")
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:pie, 5))
    @player.found_treasure(Treasure.new(:bottle, 25))
    expect(@player.score).to eq(180)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do 
    @player.blam
    expect(@player.health).to eq(@initial_health - 10)
  end

  it "computes points as the sum of all treasure points" do
    expect(@player.points).to eq(0)
  
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    expect(@player.points).to eq(50)
  
    @player.found_treasure(Treasure.new(:crowbar, 400))
  
    expect(@player.points).to eq(450)
  
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    expect(@player.points).to eq(500)
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    
    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq([
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
    ])
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