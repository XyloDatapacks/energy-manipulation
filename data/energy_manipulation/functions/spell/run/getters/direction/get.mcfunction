# in: "energy_manipulation:op direction_in", "energy_manipulation:op initial_position", "energy_manipulation:op initial_rotation"
# out: "energy_manipulation:op direction_out"

# reset output
data remove storage energy_manipulation:op direction_out

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op direction_in.value
function energy_manipulation:spell/run/getters/direction/sort with storage energy_manipulation:op macro_data
