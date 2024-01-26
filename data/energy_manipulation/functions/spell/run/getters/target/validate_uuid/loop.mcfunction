#==<Reroute Check>==#
# Check if entity is a valid target or if there is some rerouting to do
# (if "#xem.spell.run.getters.target._reroute.reroute_state xem.op" = 1, then i cannot select this entity)

scoreboard players set #xem.spell.run.getters.target._reroute.selector_type xem.op 2
scoreboard players set #xem.spell.run.getters.target._reroute.max_iterations xem.op 3
function energy_manipulation:spell/run/getters/target/_reroute/check with storage energy_manipulation:op target_out[-1]

#==<Run Validation Check>==#

# get uuid
execute unless score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op target_out[-1].uuid
# run check
execute unless score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/check

#==<Cycle Through Entries>==#

# cycle elements (erase if target not found)
execute unless score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op target_out prepend from storage energy_manipulation:op target_out[-1]
data remove storage energy_manipulation:op target_out[-1]
# loop
scoreboard players remove #xem.spell.run.getters.target.validate_uuid.targets_count xem.op 1
execute if score #xem.spell.run.getters.target.validate_uuid.targets_count xem.op matches 1.. run function energy_manipulation:spell/run/getters/target/validate_uuid/loop

