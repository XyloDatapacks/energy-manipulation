#==<Can Select Target Check>==#

#extra check for concealed targets
scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 1
execute if score #xem.spell.run.getters.target.get.ignore_focus xem.op matches 0 if score @s xem.mind.is_concealed matches 1 run function energy_manipulation:spell/run/getters/target/_is_in_sight
execute if score #xem.spell.run.getters.target._is_in_sight xem.op matches 0 run return 0

#==<Get UUID>==#

#get uuid
function xylo_library:utilities/uuid/generate
data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out

#==<REROUTH>==#

#if this is rerouth entity, add origin_uuid
execute if entity @s[tag=xem.mind.meditation.entity] on vehicle on passengers if entity @s[type=minecraft:marker,tag=xem.mind.meditation.entity] run data modify storage energy_manipulation:op target_out[-1].origin_uuid set from entity @s data.xylo_library.clone.owner_uuid
# other rerouth cases here...

# TODO
# ignore check: is origin_uuid one of the entities to ignore? if yes then fail 
# i have to apply the check only if volume selections cause, as of now, ignore is only on weak selectors

#==<Output>==#

# confirm entity found
scoreboard players set xem.spell.run.getters.target.found xem.op 1
