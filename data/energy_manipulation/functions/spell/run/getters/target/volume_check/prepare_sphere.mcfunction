# set distance
data modify storage energy_manipulation:op target merge value {min_distance:"0",max_distance:""}
data modify storage energy_manipulation:op target.min_distance set from storage energy_manipulation:op target_in.distance.min_distance
data modify storage energy_manipulation:op target.max_distance set from storage energy_manipulation:op target_in.distance.max_distance
