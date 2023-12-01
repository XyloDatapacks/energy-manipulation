# in: "energy_manipulation:op direction_in"

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.yawn set from storage energy_manipulation:op direction_in.angle.yawn
data modify storage energy_manipulation:op macro_data.pitch set from storage energy_manipulation:op direction_in.angle.pitch
execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/rotated_view_plane/xlm.rotate with storage energy_manipulation:op macro_data
