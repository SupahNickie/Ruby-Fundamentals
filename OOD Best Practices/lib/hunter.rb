include Initializer

class Hunter
  attr_accessor :attack_power

  def attack(victim)
    determine_attack_power(@weapon)
    victim.defend(self)
  end

  def defend(attacker)
    damage_hunter(attacker)
    health_check(attacker)
  end

private

  def damage_hunter(attacker)
    @health -= rand((attacker.attack_power/2)..attacker.attack_power)
  end

  def health_check(attacker)
    if @health <= 0
      puts "The #{attacker.species.upcase} has triumphed over the hunter!" if attacker.is_a? Animal
      puts "Another hunter has taken you out!" if attacker.is_a? Hunter
    elsif @health <= 50
      puts "You're hurt pretty badly!"
      run_away
    end
  end

  def run_away
    @position_x += rand(-5..5)
    @position_y += rand(-5..5)
  end

  def determine_attack_power(weapon)
    case weapon
      when "spear" then instance_variable_set("@attack_power", 50)
      when "bow" then instance_variable_set("@attack_power", 70)
      when "pistol" then instance_variable_set("@attack_power", 170)
    end
  end
end
