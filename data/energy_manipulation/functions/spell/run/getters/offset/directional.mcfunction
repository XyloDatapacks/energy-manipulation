# in: "energy_manipulation:op offset_in"
# out: "energy_manipulation:op offset_out"

data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
function energy_manipulation:spell/run/getters/macro_input/initial_rotation

data modify storage energy_manipulation:op macro_data merge value {position_x:0.0d,position_y:0.0d,position_z:0.0d}
data modify storage energy_manipulation:op macro_data.position_x set from storage energy_manipulation:op offset_in.x
data modify storage energy_manipulation:op macro_data.position_y set from storage energy_manipulation:op offset_in.y
data modify storage energy_manipulation:op macro_data.position_z set from storage energy_manipulation:op offset_in.z

execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/offset/xlm.directional2 with storage energy_manipulation:op macro_data
