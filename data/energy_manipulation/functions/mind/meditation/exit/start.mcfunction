tag @s remove xem.mind.meditation.is_meditating
tag @s remove xem.mind.expand.is_expanding

tag @s add xem.mind.meditation.player
scoreboard players set #xem.mind.meditation.exit.found_body xem.op 0
execute as @e[type=minecraft:area_effect_cloud,tag=xem.mind.meditation.entity] run function energy_manipulation:mind/meditation/exit/kill_entity
tag @s remove xem.mind.meditation.player
execute if score #xem.mind.meditation.exit.found_body xem.op matches 0 run function xylo_library:utilities/uuid/generate
execute if score #xem.mind.meditation.exit.found_body xem.op matches 0 run function energy_manipulation:mind/meditation/exit/pos_from_storage with storage gu:main {}

#load from prev gamemode
gamemode survival @s[scores={xem.mind.meditation.previous_gamemode=0}]
gamemode creative @s[scores={xem.mind.meditation.previous_gamemode=1}]
gamemode adventure @s[scores={xem.mind.meditation.previous_gamemode=2}]
gamemode spectator @s[scores={xem.mind.meditation.previous_gamemode=3}]

# give effect
effect clear @s[predicate=energy_manipulation:mind/meditation/blindness] minecraft:blindness
