# <@>545ec994-ae69-485d-9604-981ce1612a99
# -> {initial_yawn, initial_pitch, yawn, pitch}


$execute in minecraft:overworld positioned 0.0 0.0 0.0 rotated $(yawn) $(pitch) run tp @s ^ ^ ^1
data modify storage energy_manipulation:op temp_pos set from entity @s Pos
execute in minecraft:overworld run tp @s 0.0 0.0 0.0

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.initial_yawn set from storage energy_manipulation:op initial_rotation[0]
data modify storage energy_manipulation:op macro_data.initial_pitch set from storage energy_manipulation:op initial_rotation[1]
data modify storage energy_manipulation:op macro_data.position_x set from storage energy_manipulation:op temp_pos[0]
data modify storage energy_manipulation:op macro_data.position_y set from storage energy_manipulation:op temp_pos[1]
data modify storage energy_manipulation:op macro_data.position_z set from storage energy_manipulation:op temp_pos[2]
function energy_manipulation:spell/run/getters/direction/rotated_view_plane/xlm.rotate2 with storage energy_manipulation:op macro_data
