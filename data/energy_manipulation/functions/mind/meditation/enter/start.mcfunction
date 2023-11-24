#body
execute summon minecraft:marker run function energy_manipulation:mind/meditation/enter/get_rotation
function energy_manipulation:mind/meditation/enter/body with storage energy_manipulation:op temp_rotation_macro

tp @s ^ ^0.5 ^-1.5

#timer
scoreboard players operation @s xem.meditation.end_time = #xlib.time xlib.op
scoreboard players add @s xem.meditation.end_time 200
tag @s add xem.meditation.is_meditating

#save prev gamemode
execute if entity @s[gamemode=survival] run scoreboard players set @s xem.meditation.previous_gamemode 0
execute if entity @s[gamemode=creative] run scoreboard players set @s xem.meditation.previous_gamemode 1
execute if entity @s[gamemode=adventure] run scoreboard players set @s xem.meditation.previous_gamemode 2
execute if entity @s[gamemode=spectator] run scoreboard players set @s xem.meditation.previous_gamemode 3
#change gamemode
gamemode spectator @s
