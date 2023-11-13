# in: "energy_manipulation:op instruction"

data modify storage energy_manipulation:op direction_in set from storage energy_manipulation:op instruction
function energy_manipulation:spell/run/getters/direction/get
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op direction_out

