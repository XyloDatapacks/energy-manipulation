tag @s remove xem.meditation.is_meditating

#load from prev gamemode
#...

gamemode survival @s

tag @s add xem.meditation.player
execute as @e[type=minecraft:area_effect_cloud,tag=xem.meditation.entity] run function energy_manipulation:meditation/exit/kill_entity
tag @s remove xem.meditation.player
