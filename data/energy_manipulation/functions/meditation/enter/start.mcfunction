tag @s add xem.meditation.player
data modify storage energy_manipulation:op temp_uuid set from entity @s UUID
summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Tags:["xem.meditation.entity","xem.meditation.entity_new"],DisabledSlots:4144959,Passengers:[{id:"minecraft:area_effect_cloud",Duration:1000000000,Tags:["xem.meditation.entity"]}]}
execute as @e[type=minecraft:armor_stand,distance=..0.01,tag=xem.meditation.entity_new] run function energy_manipulation:meditation/enter/set_entity_data
tag @s remove xem.meditation.player

scoreboard players operation @s xem.meditation.end_time = #xlib.time xlib.op
scoreboard players add @s xem.meditation.end_time 200
tag @s add xem.meditation.is_meditating

#save prev gamemode
#...

gamemode spectator @s
