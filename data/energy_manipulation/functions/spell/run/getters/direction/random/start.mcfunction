# in: "energy_manipulation:op direction_in"

#kinda same as rotated_view_plane/start (but gets angle random)

#get random offset
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/direction/random/get_random with storage energy_manipulation:op direction_in
execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/rotated_view_plane/xlm.rotate with storage energy_manipulation:op macro_data
