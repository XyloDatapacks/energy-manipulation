# in: "energy_manipulation:op angle_in"
# out: "energy_manipulation:op angle_out"

data modify storage energy_manipulation:op angle_out set from storage energy_manipulation:op initial_rotation
execute unless data storage energy_manipulation:op angle_in{value:"pitch"} store result storage energy_manipulation:op angle_out[0] float 0.001 run data get storage energy_manipulation:op angle_in.yawn 1000
execute unless data storage energy_manipulation:op angle_in{value:"yawn"} store result storage energy_manipulation:op angle_out[1] float 0.001 run data get storage energy_manipulation:op angle_in.pitch 1000
