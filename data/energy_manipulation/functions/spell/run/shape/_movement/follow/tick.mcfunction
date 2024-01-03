# <@> movement entity

# get data
execute on passengers if entity @s[tag=xem.spell.shape_marker] run data modify storage energy_manipulation:op shape_movement_data set from entity @s data.energy_manipulation.shape.movement

# update target
execute unless data storage energy_manipulation:op shape_movement_data.target{value:"none"} run function energy_manipulation:spell/run/shape/_movement/follow/update_follow_targets/position
execute if data storage energy_manipulation:op shape_movement_data.follow_rotation.target run function energy_manipulation:spell/run/shape/_movement/follow/update_follow_targets/rotation
execute if data storage energy_manipulation:op shape_movement_data.follow_rotation.position.target run function energy_manipulation:spell/run/shape/_movement/follow/update_follow_targets/rotation2

# move
data modify storage energy_manipulation:op marco_data set from storage energy_manipulation:op shape_movement_data.consolidated_follow
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"cardinal"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_cardinal with storage energy_manipulation:op marco_data
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"directional"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_directional with storage energy_manipulation:op marco_data

