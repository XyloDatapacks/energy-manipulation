# in: "energy_manipulation:op offset_in", "energy_manipulation:op initial_position", "energy_manipulation:op initial_rotation"
# out: "energy_manipulation:op offset_out"

# reset output
data remove storage energy_manipulation:op offset_out

execute if data storage energy_manipulation:op offset_in{offset_format:"cardinal"} run function energy_manipulation:spell/run/getters/offset/cardinal
execute if data storage energy_manipulation:op offset_in{offset_format:"directional"} run function energy_manipulation:spell/run/getters/offset/directional

