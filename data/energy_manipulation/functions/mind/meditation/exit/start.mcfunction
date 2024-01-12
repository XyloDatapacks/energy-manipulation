tag @s remove xem.mind.meditation.is_meditating
tag @s remove xem.mind.expand.is_expanding

tag @s add xem.mind.meditation.player
execute as @e[type=minecraft:area_effect_cloud,tag=xem.mind.meditation.entity] run function energy_manipulation:mind/meditation/exit/kill_entity
execute at @s run tp @s ~ ~0.55 ~
tag @s remove xem.mind.meditation.player

#load from prev gamemode
gamemode survival @s[scores={xem.mind.meditation.previous_gamemode=0}]
gamemode creative @s[scores={xem.mind.meditation.previous_gamemode=1}]
gamemode adventure @s[scores={xem.mind.meditation.previous_gamemode=2}]
gamemode spectator @s[scores={xem.mind.meditation.previous_gamemode=3}]

