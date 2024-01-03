# <@> movement entity
execute on passengers if entity @s[tag=xem.spell.shape_marker] run data modify storage energy_manipulation:op shape_movement_data set from entity @s data.energy_manipulation.shape.movement

data modify storage energy_manipulation:op marco_data set from storage energy_manipulation:op shape_movement_data.consolidated_follow
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"cardinal"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_cardinal with storage energy_manipulation:op marco_data
execute if data storage energy_manipulation:op shape_movement_data.offset{offset_format:"directional"} run function energy_manipulation:spell/run/shape/_movement/follow/follow_directional with storage energy_manipulation:op marco_data

data modify storage test:op test set from storage energy_manipulation:op shape_movement_data.consolidated_follow
