# in: "energy_manipulation:op angle_in", "energy_manipulation:op initial_position", "energy_manipulation:op initial_rotation"
# out: "energy_manipulation:op angle_out"

# reset output
data remove storage energy_manipulation:op angle_out

execute if data storage energy_manipulation:op angle_in{angle_format:"absolute"} run function energy_manipulation:spell/run/getters/angle/absolute
execute if data storage energy_manipulation:op angle_in{angle_format:"delta"} run function energy_manipulation:spell/run/getters/angle/delta

