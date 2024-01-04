# <@> display entity (can be shape display)

#init data
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow set value {position_x:0,position_y:0,position_z:0}
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.anchor set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.anchor
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.position_x set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.offset.x
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.position_y set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.offset.y
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.position_z set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.offset.z
tag @s add xem.spell.run.shape._movement.follow
