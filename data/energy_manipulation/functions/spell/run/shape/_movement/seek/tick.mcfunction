# <@> movement entity

# get data
execute on passengers on passengers if entity @s[tag=xem.spell.shape_marker] run data modify storage energy_manipulation:op shape_movement_data set from entity @s {}

#prepare to get motion modulo
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.Motion set from entity @s Motion
data modify storage energy_manipulation:op macro_data.x set from storage energy_manipulation:op macro_data.Motion[0]
data modify storage energy_manipulation:op macro_data.y set from storage energy_manipulation:op macro_data.Motion[1]
data modify storage energy_manipulation:op macro_data.z set from storage energy_manipulation:op macro_data.Motion[2]
#get motion modulo
function xylo_library:utilities/distance/distance with storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op shape_movement_data.data.energy_manipulation.shape.movement.consolidated_seek.initial_speed set from storage xylo_library:op distance_out
# update seek data
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op shape_movement_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op shape_movement_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op shape_movement_data.data.energy_manipulation.spell_data
data modify storage energy_manipulation:op shape_movement_data set from storage energy_manipulation:op shape_movement_data.data.energy_manipulation.shape.movement
function energy_manipulation:spell/run/shape/_movement/seek/get_seek/target
data modify storage energy_manipulation:op shape_movement_data.consolidated_seek.yawn set from storage energy_manipulation:op initial_rotation[0]
data modify storage energy_manipulation:op shape_movement_data.consolidated_seek.pitch set from storage energy_manipulation:op initial_rotation[1]

# move
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"cardinal"} run function energy_manipulation:spell/run/shape/_movement/seek/seek_cardinal with storage energy_manipulation:op shape_movement_data.consolidated_seek
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"directional"} run function energy_manipulation:spell/run/shape/_movement/seek/seek_directional with storage energy_manipulation:op shape_movement_data.consolidated_seek
execute if data storage energy_manipulation:op shape_movement_data.offset{value:"none"} run function energy_manipulation:spell/run/shape/_movement/seek/seek_no_offset with storage energy_manipulation:op shape_movement_data.consolidated_seek
