# <@> player


# fxs
execute at @s run function energy_manipulation:mind/meditation/fx/exit/start

# clear effects
effect clear @s 

# clear sb and tags
tag @s remove xem.mind.meditation.is_meditating
scoreboard players operation @s xem.mind.meditation.end_time = #xlib.time xlib.op
scoreboard players remove @s xem.mind.meditation.end_time 1

scoreboard players set @s xem.mind.meditation.action.propel 0

# remove clone and tp to original pos
data remove storage energy_manipulation:op meditation_data
function xylo_library:utilities/uuid/generate
function energy_manipulation:mind/meditation/exit/get_clone with storage gu:main {}



# give back items
data modify storage xylo_library:op set_inventory_in set from storage energy_manipulation:op meditation_data.inventory
function xylo_library:utilities/set_inventory/start

# set effects
data modify storage xylo_library:op set_effects_in set from storage energy_manipulation:op meditation_data.active_effects
function xylo_library:utilities/set_effects/start

# Attributes
attribute @s minecraft:generic.scale modifier remove 1234-1234-1234-1-1
attribute @s minecraft:player.entity_interaction_range modifier remove 1234-1234-1234-1-1
attribute @s minecraft:player.block_interaction_range modifier remove 1234-1234-1234-1-1