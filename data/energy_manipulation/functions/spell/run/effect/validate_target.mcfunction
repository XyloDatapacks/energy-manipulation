execute if entity @s[tag=xem.spell.shape_marker] run return 0
execute if entity @s[tag=xem.spell.projectile_type] run return 0
execute if entity @s[type=#energy_manipulation:boss] run return 1
execute if entity @s[tag=smithed.strict] run return 2
return 0