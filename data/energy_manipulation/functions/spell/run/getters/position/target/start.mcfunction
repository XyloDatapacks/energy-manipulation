# in: "energy_manipulation:op position_in"

data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op position_in.target
data modify storage energy_manipulation:op target_in.selection set value "single"
execute unless function energy_manipulation:spell/run/getters/target/get run return 0

# get rotation from target
data modify storage energy_manipulation:op macro_data set value {anchor:"feet"}
data modify storage energy_manipulation:op macro_data.anchor set from storage energy_manipulation:op position_in.anchor
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op target_out[0].uuid
function energy_manipulation:spell/run/getters/position/target/position with storage energy_manipulation:op macro_data
