include Initializer

class Animal

  def attack(victim)
    victim.defend(self)
  end

  def defend(attacker)
    damage_creature(attacker)
    health_check
    if @type == "prey"
      run_away
      puts "The #{@species.upcase} is now at #{@position_x}, #{@position_y}"
    elsif @type == "predator"
      attack(attacker)
    end
  end

private

  def damage_creature(attacker)
    @health -= rand((attacker.attack_power/2)..attacker.attack_power)
  end

  def health_check
    if @health <= 0
      puts "The hunter has triumphed over the #{@species.upcase}!"
    elsif @health <= 50
      puts "The #{@species.upcase}'S health is #{@health}"
    end
  end

  def run_away
    @position_x += rand(-5..5)
    @position_y += rand(-5..5)
  end

end
