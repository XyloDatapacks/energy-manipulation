#==<Body>==#
data modify storage xylo_library:op clone_input_data set value {tags:["xem.mind.meditation.entity"],hitbox:{tags:["xem.mind.meditation.entity"]},marker:{tags:["xem.spell.non_selectable","xem.mind.meditation.entity"]},aoe:{tags:["xem.spell.non_selectable","xem.mind.meditation.entity"]}}
execute store result storage xylo_library:op clone_input_data.duration int 1 run scoreboard players get #xem.mind.meditation.duration xem.op
function xylo_library:internal/clone/generate/start

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