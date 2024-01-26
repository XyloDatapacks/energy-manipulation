# in: "energy_manipulation:op target_in"
# in: "energy_manipulation:op target_out" (targets to verify)
# in: "#xem.spell.run.getters.target.validate_uuid.skip_tags xem.op" (optional)

# out: "energy_manipulation:op target_out" (cleanded from targets not verified)
# out: "xem.spell.run.getters.target.found xem.op"

scoreboard players set xem.spell.run.getters.target.found xem.op 0

#==<Entries Number>==#

# Verify at least one target is selected
execute store result score #xem.spell.run.getters.target.validate_uuid.targets_count xem.op run data get storage energy_manipulation:op target_out
execute unless score #xem.spell.run.getters.target.validate_uuid.targets_count xem.op matches 1.. run return 0

#==<Init>==#
data modify storage energy_manipulation:op macro_data set value {feature:"none"}

#==<Distance>==#

# check if distance check is needed
execute if data storage energy_manipulation:op target_in.distance unless data storage energy_manipulation:op target_in.distance{value:"none"} run scoreboard players set #xem.spell.run.getters.target.validate_uuid.distance_check xem.op 1
# get pos (if i want to check distance)
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/macro_input/initial_position
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
# set distance (if i want to check distance)
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data merge value {min_distance:"0",max_distance:""}
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data.min_distance set from storage energy_manipulation:op target_in.distance.min_distance
execute if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run data modify storage energy_manipulation:op macro_data.max_distance set from storage energy_manipulation:op target_in.distance.max_distance

#==<Feature>==#

#feature
data modify storage energy_manipulation:op macro_data.feature set from storage energy_manipulation:op target_in.feature

#==<Cycle Through Entries>==#

# loop
function energy_manipulation:spell/run/getters/target/validate_uuid/loop
scoreboard players reset #xem.spell.run.getters.target.validate_uuid.distance_check xem.op

#==<Output>==#

# see if at least one target is valid
execute store success score xem.spell.run.getters.target.found xem.op run data get storage energy_manipulation:op target_out[0].uuid


