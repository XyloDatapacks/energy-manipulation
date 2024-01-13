tp @s ~ ~ ~ ~ ~

data modify storage energy_manipulation:op temp_data set from entity @s {}
data modify storage energy_manipulation:op macro_data.yawn set from storage energy_manipulation:op temp_data.Rotation[0]
data modify storage energy_manipulation:op macro_data.pitch set from storage energy_manipulation:op temp_data.Rotation[1]
data modify storage energy_manipulation:op macro_data.pos_x set from storage energy_manipulation:op temp_data.Pos[0]
data modify storage energy_manipulation:op macro_data.pos_y set from storage energy_manipulation:op temp_data.Pos[1]
data modify storage energy_manipulation:op macro_data.pos_z set from storage energy_manipulation:op temp_data.Pos[2]
function xylo_library:utilities/get_dimension_id/get
data modify storage energy_manipulation:op macro_data.dimension set from storage xylo_library:op get_dimension_id.dimension

kill @s