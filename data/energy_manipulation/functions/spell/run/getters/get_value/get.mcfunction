# in: "energy_manipulation:op get_value_in", "energy_manipulation:op initial_position", "energy_manipulation:op initial_rotation"
# out: "energy_manipulation:op get_value_out"

# reset output
data remove storage energy_manipulation:op get_value_out

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op get_value_in.value
function energy_manipulation:spell/run/getters/get_value/sort with storage energy_manipulation:op macro_data
