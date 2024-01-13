#body
data remove storage energy_manipulation:op macro_data
execute at @s summon minecraft:marker run function energy_manipulation:mind/meditation/enter/get_position
function xylo_library:utilities/player_name/get_name
data modify storage energy_manipulation:op macro_data.name set from storage xylo_library:op player_name
function energy_manipulation:mind/meditation/enter/body with storage energy_manipulation:op macro_data

#to make you see your body
tp @s ^ ^0.5 ^-1.5

#timer
scoreboard players operation @s xem.mind.meditation.end_time = #xlib.time xlib.op
scoreboard players operation @s xem.mind.meditation.end_time += #xem.mind.meditation.duration xem.op
tag @s add xem.mind.meditation.is_meditating
tag @s add xem.mind.expand.is_expanding

#save prev gamemode
execute if entity @s[gamemode=survival] run scoreboard players set @s xem.mind.meditation.previous_gamemode 0
execute if entity @s[gamemode=creative] run scoreboard players set @s xem.mind.meditation.previous_gamemode 1
execute if entity @s[gamemode=adventure] run scoreboard players set @s xem.mind.meditation.previous_gamemode 2
execute if entity @s[gamemode=spectator] run scoreboard players set @s xem.mind.meditation.previous_gamemode 3
#change gamemode
gamemode spectator @s

# give effect
effect give @s minecraft:blindness infinite 245 true