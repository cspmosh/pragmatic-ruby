require_relative 'game'
require_relative 'player'

describe Game do
  before do
    @game = Game.new("W00t & Blam")
    @initial_health = 100
    @player = Player.new("josh", @initial_health)
    @game.add_player(@player)
    @rounds = 2
  end
  
  it "rolls a high number" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)
    @game.play(@rounds)
    expect(@player.health).to eq(@initial_health + (15 * @rounds))
  end

  it "skips the player if a medium number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play(@rounds)
    expect(@player.health).to eq(@initial_health)
  end

  it "woots a player if a low number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(1)
    @game.play(@rounds)
    expect(@player.health).to eq(@initial_health - (10 * @rounds))
  end

  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")
    game.add_player(player)
    game.play(1)
    expect(player.points).not_to be_zero
  end
end