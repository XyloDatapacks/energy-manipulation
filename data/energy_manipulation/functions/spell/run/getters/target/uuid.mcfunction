#==<Can Select Target Check>==#

#extra check for concealed targets
execute if score #xem.spell.run.getters.target.get.ignore_focus xem.op matches 0 if score @s xem.mind.is_concealed matches 1 unless function energy_manipulation:spell/run/getters/target/_is_in_sight run return 0

#==<Get UUID>==#

#get uuid
function xylo_library:utilities/uuid/generate
data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out

#==<Reroute Check>==#
# Check if entity is a valid target or if there is some rerouting to do
# (if "#xem.spell.run.getters.target._reroute.reroute_state xem.op" = 1, then i cannot select this entity)

scoreboard players set #xem.spell.run.getters.target._reroute.selector_type xem.op 1
scoreboard players set #xem.spell.run.getters.target._reroute.max_iterations xem.op 3
function energy_manipulation:spell/run/getters/target/_reroute/check with storage energy_manipulation:op target_out[-1]
execute if score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run return run data remove storage energy_manipulation:op target_out[-1]

# TODO
# ignore check: is origin_uuid one of the entities to ignore? if yes then fail 
# i have to apply the check only if volume selections cause, as of now, ignore is only on weak selectors

#==<Output>==#

# confirm entity found
scoreboard players set xem.spell.run.getters.target.found xem.op 1
