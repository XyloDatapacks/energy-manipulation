#to be used at the beginning of the effect function
#return >= 1 must be excluded by anything different from damage
#return = 3 must terminate function instantly
#return <= 1 handled case by case

#internal
execute if entity @s[tag=xem.spell.shape_marker] run return -1
execute if entity @s[tag=xem.spell.projectile_type] run return -2
#external
execute if entity @s[type=#energy_manipulation:boss] run return 1
execute if entity @s[tag=smithed.strict] run return 2
execute if entity @s[gamemode=spectator] run return 3

return 0