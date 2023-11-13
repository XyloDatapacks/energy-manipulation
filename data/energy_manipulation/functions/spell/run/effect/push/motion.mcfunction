data modify storage energy_manipulation:op direction_in set from storage energy_manipulation:op spell_effect.effect.direction
function energy_manipulation:spell/run/getters/direction/get

data remove storage energy_manipulation:op macro_data 
# rotation
data modify storage energy_manipulation:op macro_data.rot_x set from storage energy_manipulation:op initial_rotation[0]
data modify storage energy_manipulation:op macro_data.rot_y set from storage energy_manipulation:op initial_rotation[1]
data modify storage energy_manipulation:op macro_data.rot_x set from storage energy_manipulation:op direction_out[0]
data modify storage energy_manipulation:op macro_data.rot_y set from storage energy_manipulation:op direction_out[1]
# target
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
function energy_manipulation:spell/run/effect/push/motion2 with storage energy_manipulation:op macro_data

