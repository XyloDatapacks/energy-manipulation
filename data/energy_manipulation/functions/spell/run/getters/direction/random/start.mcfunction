# in: "energy_manipulation:op direction_in"

#set angle
data modify storage energy_manipulation:op angle_in set value {angle_format:"delta"}
#get random offset
function energy_manipulation:spell/run/getters/direction/random/get_random with storage energy_manipulation:op direction_in
#apply angle
function energy_manipulation:spell/run/getters/angle/get
data modify storage energy_manipulation:op direction_out set from storage energy_manipulation:op angle_out