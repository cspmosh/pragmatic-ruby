class Player
  def initialize(name, health=100)
    @firstName = name.capitalize
    @health = health
  end

  def blam
    @health -= 10
    puts "#{@firstName} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@firsttName} got w00ted!"
  end

  def to_s
    "I'm #{@firstName} with a health of #{@health}"
  end
end