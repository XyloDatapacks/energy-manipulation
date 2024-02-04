# in: "energy_manipulation:op direction_in"

data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op direction_in.target
data modify storage energy_manipulation:op target_in.selection set value "single"
execute unless function energy_manipulation:spell/run/getters/target/get run return 0

# get rotation from target
function energy_manipulation:spell/run/getters/direction/aim_point/find_point with storage energy_manipulation:op target_out[0]


