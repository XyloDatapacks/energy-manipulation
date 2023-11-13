# in: "energy_manipulation:op direction_in"

data modify storage energy_manipulation:op angle_in set from storage energy_manipulation:op direction_in.angle
function energy_manipulation:spell/run/getters/angle/get
data modify storage energy_manipulation:op direction_out set from storage energy_manipulation:op angle_out