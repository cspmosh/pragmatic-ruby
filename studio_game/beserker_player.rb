require_relative 'player'
require_relative 'treasure_trove'

class BeserkerPlayer < Player 

  def initialize(name, health=100)
    super(name, health)
    @w00t_count = 0
  end

  def w00t
    @w00t_count += 1
    super
    puts "#{@name} is beserk!" if beserk?
  end

  def blam
    beserk? ? w00t : super
  end

  def beserk?
    @w00t_count > 5
  end
end