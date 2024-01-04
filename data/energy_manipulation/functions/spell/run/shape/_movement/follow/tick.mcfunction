# <@> movement entity

# get data
execute on passengers if entity @s[tag=xem.spell.shape_marker] run data modify storage energy_manipulation:op shape_movement_data set from entity @s {}

# update follow data
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op shape_movement_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op shape_movement_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op shape_movement_data.data.energy_manipulation.spell_data
data modify storage energy_manipulation:op shape_movement_data set from storage energy_manipulation:op shape_movement_data.data.energy_manipulation.shape.movement
function energy_manipulation:spell/run/shape/_movement/follow/get_follow/target
function energy_manipulation:spell/run/shape/_movement/follow/get_follow/direction

# move
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"cardinal"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_cardinal with storage energy_manipulation:op shape_movement_data.consolidated_follow
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"directional"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_directional with storage energy_manipulation:op shape_movement_data.consolidated_follow
execute if data storage energy_manipulation:op shape_movement_data.offset{value:"none"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_no_offset with storage energy_manipulation:op shape_movement_data.consolidated_follow
