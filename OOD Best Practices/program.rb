require_relative 'initializer'
require_relative 'lib/hunter'
require_relative 'lib/animal'

hunter = Hunter.new( {weapon: "spear", health: 100, position_x: 5, position_y: 7} )
hunter2 = Hunter.new( {weapon: "bow", health: 100, position_x: 10, position_y: 3} )
deer = Animal.new( {species: "deer", position_x: 4, position_y: 3, meat: 30, speed: 50, health: 100, type: "prey"} )
tiger = Animal.new( {species: "tiger", position_x: 6, position_y: 1, attack_power: 110, health: 100, type: "predator"} )
hunter.attack(tiger)
puts "HUNTER HEALTH = #{hunter.health}"
puts "TIGER HEALTH = #{tiger.health}"
hunter2.attack(tiger)
puts "HUNTER2 HEALTH = #{hunter2.health}"
puts "TIGER HEALTH = #{tiger.health}"
hunter.attack(deer)
hunter2.attack(deer)
hunter3 = Hunter.new( {weapon: "pistol", health: 100, position_x: 7, position_y: 7} )
hunter3.attack(hunter)
