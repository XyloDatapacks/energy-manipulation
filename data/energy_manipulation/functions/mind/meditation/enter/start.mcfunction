#==<Body>==#
data modify storage xylo_library:op clone_input_data set value {tags:["xem.mind.meditation.entity"],hitbox:{tags:["xem.mind.meditation.entity","xem.spell.run.getters.target._reroute.entity"]},marker:{tags:["xem.spell.non_selectable","xem.mind.meditation.entity"]},aoe:{tags:["xem.spell.non_selectable","xem.mind.meditation.entity"]}}
execute store result storage xylo_library:op clone_input_data.duration int 1 run scoreboard players get #xem.mind.meditation.duration xem.op
function xylo_library:internal/clone/generate/start

# save clone data in energy_manipulation:data player's storage
function energy_manipulation:mind/meditation/enter/save_in_storage with storage xylo_library:op clone_owner_hex_uuid

#to make you see your body
execute rotated ~ 10 run tp @s ^ ^0.8 ^-1.5 ~ ~


#==<Timer>==#

#timer
scoreboard players operation @s xem.mind.meditation.start_time = #xlib.time xlib.op
scoreboard players operation @s xem.mind.meditation.end_time = #xlib.time xlib.op
scoreboard players operation @s xem.mind.meditation.end_time += #xem.mind.meditation.duration xem.op
tag @s add xem.mind.meditation.is_meditating