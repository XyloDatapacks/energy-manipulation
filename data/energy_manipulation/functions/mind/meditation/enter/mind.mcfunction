
execute align xyz run summon minecraft:shulker ~0.5 8298 ~0.5 {NoAI:1b,Silent:1b,Invulnerable:1b,Tags:["xem.mind.meditation.mind.detector_entity","xem.mind.meditation.mind.detector_entity_new"],DeathLootTable:"xylo_library:empty"}
execute align xyz run summon minecraft:horse ~0.5 8299 ~0.5 {Tags:["xem.mind.meditation.mind.detector_entity","xem.mind.meditation.mind.detector_entity_new"],Invulnerable:1b,Silent:1b,NoAI:1b,Tame:1b,Age:-1000000,DeathLootTable:"xylo_library:empty",Attributes:[{Name:horse.jump_strength,Base:0.1}],SaddleItem:{id:"minecraft:saddle",Count:1b},ArmorItem:{}}
summon snowball ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},NoGravity:1b,Tags:["xem.mind.meditation.mind.mind_entity"],Passengers:[{id:"minecraft:item_display",Tags:["xem.mind.meditation.mind.mind_entity","xem.mind.meditation.mind.mind_entity_new"],teleport_duration:1,Passengers:[{id:"minecraft:marker",Tags:["xem.mind.meditation.mind.mind_entity"]}]}]}

# mind entity
spectate @e[type=minecraft:item_display,distance=..0.01,limit=1,tag=xem.mind.meditation.mind.mind_entity_new]
tp @e[type=minecraft:item_display,distance=..0.01,limit=1] ~ ~ ~ ~ ~

# detector entity
execute align xyz positioned ~0.5 8299 ~0.5 run ride @s mount @e[type=minecraft:horse,distance=..0.01,limit=1,tag=xem.mind.meditation.mind.detector_entity_new]
execute on vehicle run data modify entity @s Owner set from storage energy_manipulation:op meditation_player_uuid
execute on vehicle run tag @s remove xem.mind.meditation.mind.detector_entity_new


#==<get all uuids>==#

# owner uuid
data remove storage energy_manipulation:op meditation_mind_all_uuids
data modify storage energy_manipulation:op meditation_mind_all_uuids.owner_uuid set from storage energy_manipulation:op meditation_player_hex_uuid
# horse uuid
execute on vehicle run function xylo_library:utilities/uuid/generate
data modify storage energy_manipulation:op meditation_mind_all_uuids.horse_uuid set from storage gu:main out
# shulker uuid
execute align xyz positioned ~0.5 8298 ~0.5 as @e[type=minecraft:shulker,distance=..0.01,limit=1,tag=xem.mind.meditation.mind.detector_entity_new] run function xylo_library:utilities/uuid/generate
execute align xyz positioned ~0.5 8298 ~0.5 as @e[type=minecraft:shulker,distance=..0.01,limit=1] run tag @s remove xem.mind.meditation.mind.detector_entity_new
data modify storage energy_manipulation:op meditation_mind_all_uuids.shulker_uuid set from storage gu:main out
# pass all uuids to mind marker
execute as @e[type=minecraft:item_display,distance=..0.01,limit=1,tag=xem.mind.meditation.mind.mind_entity_new] on passengers run data modify entity @s data.energy_manipulation.meditation set from storage energy_manipulation:op meditation_mind_all_uuids

#==<Life Time>==#

# body life time
scoreboard players operation #xem.mind.meditation.end_time xem.op = #xlib.time xlib.op
scoreboard players operation #xem.mind.meditation.end_time xem.op += #xem.mind.meditation.duration xem.op 
execute as @e[type=minecraft:item_display,distance=..0.01,limit=1,tag=xem.mind.meditation.mind.mind_entity_new] on passengers run scoreboard players operation @s xem.mind.meditation.end_time = #xem.mind.meditation.end_time xem.op

# remove tag
tag @e[type=minecraft:item_display,distance=..0.01,limit=1] remove xem.mind.meditation.mind.mind_entity_new
