ride @s dismount

#==<Player Uuid>==#

# player uuid
data modify storage energy_manipulation:op meditation_player_uuid set from entity @s UUID
# player hex uuid
data modify storage gu:main in set from storage energy_manipulation:op meditation_player_uuid
function xylo_library:utilities/uuid/generate_from_storage
data modify storage energy_manipulation:op meditation_player_hex_uuid set from storage gu:main out


#==<Body>==#

data remove storage energy_manipulation:op macro_data
# get position
execute summon minecraft:marker run function energy_manipulation:mind/meditation/enter/get_position
# get name
function xylo_library:utilities/player_name/get_name
data modify storage energy_manipulation:op macro_data.name set from storage xylo_library:op player_name
# generate body
function energy_manipulation:mind/meditation/enter/body with storage energy_manipulation:op macro_data

#to make you see your body
execute rotated ~ 10 run tp @s ^ ^0.8 ^-1.5 ~ ~


#==<Mind>==#

#save prev gamemode
execute if entity @s[gamemode=survival] run scoreboard players set @s xem.mind.meditation.previous_gamemode 0
execute if entity @s[gamemode=creative] run scoreboard players set @s xem.mind.meditation.previous_gamemode 1
execute if entity @s[gamemode=adventure] run scoreboard players set @s xem.mind.meditation.previous_gamemode 2
execute if entity @s[gamemode=spectator] run scoreboard players set @s xem.mind.meditation.previous_gamemode 3
#change gamemode
gamemode spectator @s
spectate

# setup mind
execute at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:mind/meditation/enter/mind


#==<Timer>==#

#timer
scoreboard players operation @s xem.mind.meditation.end_time = #xlib.time xlib.op
scoreboard players operation @s xem.mind.meditation.end_time += #xem.mind.meditation.duration xem.op
tag @s add xem.mind.meditation.is_meditating
tag @s add xem.mind.expand.is_expanding