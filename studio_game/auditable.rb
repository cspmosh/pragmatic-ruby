module Auditable
  def audit 
    puts "rolled a #{self.number} (#{self.class})"
  end
end