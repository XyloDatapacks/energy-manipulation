# get direction
data modify storage energy_manipulation:op direction_in set from storage energy_manipulation:op shape_movement_data.direction
function energy_manipulation:spell/run/getters/direction/get

data modify storage energy_manipulation:op shape_movement_data.consolidated_follow.yawn set from storage energy_manipulation:op direction_out[0]
data modify storage energy_manipulation:op shape_movement_data.consolidated_follow.pitch set from storage energy_manipulation:op direction_out[1]