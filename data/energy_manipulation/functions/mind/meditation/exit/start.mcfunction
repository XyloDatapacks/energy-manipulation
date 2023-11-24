tag @s remove xem.meditation.is_meditating

tag @s add xem.meditation.player
execute as @e[type=minecraft:area_effect_cloud,tag=xem.meditation.entity] run function energy_manipulation:mind/meditation/exit/kill_entity
execute at @s run tp @s ~ ~0.05 ~
tag @s remove xem.meditation.player

#load from prev gamemode
gamemode survival @s[scores={xem.meditation.previous_gamemode=0}]
gamemode creative @s[scores={xem.meditation.previous_gamemode=1}]
gamemode adventure @s[scores={xem.meditation.previous_gamemode=2}]
gamemode spectator @s[scores={xem.meditation.previous_gamemode=3}]

