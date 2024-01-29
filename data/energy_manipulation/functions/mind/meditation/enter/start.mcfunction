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
scoreboard players operation #xem.mind.meditation.end_time xem.op = #xlib.time xlib.op
scoreboard players operation #xem.mind.meditation.end_time xem.op += #xem.mind.meditation.duration xem.op
scoreboard players operation @s xem.mind.meditation.end_time = #xem.mind.meditation.end_time xem.op
tag @s add xem.mind.meditation.is_meditating

#==<Mind Stack>==#

# mind stack
execute at @s run summon minecraft:snowball ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},Silent:1b,NoGravity:1b,Tags:["xem.mind.meditation.mind_entity"],Passengers:[{id:"minecraft:item_display",Tags:["xem.mind.meditation.mind_entity","xem.mind.meditation.mind_entity_new"],Passengers:[{id:"minecraft:marker",Tags:["xem.mind.meditation.mind_entity"]},{id:"minecraft:interaction",width:0.8,height:1.5,Tags:["xem.mind.meditation.mind_entity"]}]}]}
execute at @s run ride @s mount @e[type=minecraft:item_display,distance=..0.001,limit=1,tag=xem.mind.meditation.mind_entity_new]
execute on vehicle run tag @s remove xem.mind.meditation.mind_entity_new

execute on vehicle on passengers run data modify entity @s[type=minecraft:marker] data.energy_manipulation.mind.meditation.player_hex_uuid set from storage xylo_library:op clone_owner_hex_uuid.player_hex_uuid
execute on vehicle on passengers run scoreboard players operation @s[type=minecraft:marker] xem.mind.meditation.start_time = #xlib.time xlib.op
execute on vehicle on passengers run scoreboard players operation @s[type=minecraft:marker] xem.mind.meditation.end_time = #xem.mind.meditation.end_time xem.op

#==<Setup Player>==#


#TODO
# copy inventory in storage
# clear inventory (slot by slot for mod compatibility [create lib function for that])
# store player invisibility to give back after
effect give @s minecraft:invisibility infinite 100 true

# scale down player
# lower to next to zero intraction range attributes