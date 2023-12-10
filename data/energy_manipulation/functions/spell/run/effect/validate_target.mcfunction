#to be used at the beginning of the effect function
#return >= 1 must be excluded by anything different from damage
#return = 3 must terminate function instantly
#return <= 1 handled case by case

#==<Internal>==#

#spell_marker (-1: pure spell, -2: shape)
execute if entity @s[tag=xem.spell.shape_marker] run return -2
execute if entity @s[tag=xem.spell.run] run return -1

#spell stack entities (-10: projectile type)
execute if entity @s[tag=xem.spell.projectile_type] run return -10

#==<External>==#
execute if entity @s[type=#energy_manipulation:boss] run return 1
execute if entity @s[tag=smithed.strict] run return 2
execute if entity @s[gamemode=spectator] run return 3

return 0