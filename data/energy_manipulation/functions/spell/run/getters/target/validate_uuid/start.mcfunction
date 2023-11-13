# in: "energy_manipulation:op target_in"
# in: "energy_manipulation:op validate_uuid"
# in: "#xem.spell.run.getters.target.validate_uuid.distance_check xem.op"

# out: "xem.spell.run.getters.target.found xem.op"

data modify storage energy_manipulation:op macro_data set value {feature:"none"}
# get uuid
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op validate_uuid

# get pos (if i want to check distance)
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/macro_input/initial_position
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
# set distance (if i want to check distance)
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data merge value {min_distance:"0",max_distance:""}
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data.min_distance set from storage energy_manipulation:op target_in.distance.min_distance
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data.max_distance set from storage energy_manipulation:op target_in.distance.max_distance

#feature
data modify storage energy_manipulation:op macro_data.feature set from storage energy_manipulation:op target_in.feature

scoreboard players set xem.spell.run.getters.target.found xem.op 0
execute unless score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/distance_check with storage energy_manipulation:op macro_data
execute unless score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 0 run function energy_manipulation:spell/run/getters/target/validate_uuid/base_check with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/distance_check_no_tags with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 0 run function energy_manipulation:spell/run/getters/target/validate_uuid/base_check_no_tags with storage energy_manipulation:op macro_data
