# -> {uuid}

#==<Preliminary Checks>==#

# check if entity exist
$execute store success score #xem.spell.run.getters.target.validate_uuid.exists xem.op if entity $(uuid)
# if it does not exist and was not a rerouth, then return false
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 unless data storage energy_manipulation:op target_out[0].origin_uuid run return 0

#==<REROUTH>==#
# if entity not found and it was a rerouth entity -> target origin

# if it was a rerouth then pass origin_uuid as new macro uuid and update target
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op target_out[0].origin_uuid
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 run data modify storage energy_manipulation:op target_out[0].uuid set from storage energy_manipulation:op target_out[0].origin_uuid
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 run data remove storage energy_manipulation:op target_out[0].origin_uuid

#==<Check>==#

function energy_manipulation:spell/run/getters/target/validate_uuid/check2 with storage energy_manipulation:op macro_data