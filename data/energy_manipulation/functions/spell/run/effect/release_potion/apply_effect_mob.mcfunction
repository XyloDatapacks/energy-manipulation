effect give @s luck 1 0 true
effect clear @s luck
data modify storage energy_manipulation:op potion_effects[].show_particles set value 1b
data modify entity @s active_effects append from storage energy_manipulation:op potion_effects[]

