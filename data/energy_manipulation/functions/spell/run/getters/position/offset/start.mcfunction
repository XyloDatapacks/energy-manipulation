# in: "energy_manipulation:op position_in"

data modify storage energy_manipulation:op offset_in set from storage energy_manipulation:op position_in.offset
function energy_manipulation:spell/run/getters/offset/get
data modify storage energy_manipulation:op position_out set from storage energy_manipulation:op offset_out
