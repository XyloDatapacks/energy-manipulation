#==<Run Validation Check>==#

# get uuid
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op target_out[0].uuid
# run check
function energy_manipulation:spell/run/getters/target/validate_uuid/check1 with storage energy_manipulation:op macro_data

#==<Cycle Through Entries>==#

# cycle elements (erase if target not found)
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op target_out append from storage energy_manipulation:op target_out[0]
data remove storage energy_manipulation:op target_out[0]
# loop
scoreboard players remove #xem.spell.run.getters.target.validate_uuid.targets_count xem.op 1
execute if score #xem.spell.run.getters.target.validate_uuid.targets_count xem.op matches 1.. run function energy_manipulation:spell/run/getters/target/validate_uuid/loop

