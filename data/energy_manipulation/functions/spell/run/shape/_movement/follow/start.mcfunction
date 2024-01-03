# <@> display entity (can be shape display)

# get target
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.target
data modify storage energy_manipulation:op target_in.selection set value "single"
function energy_manipulation:spell/run/getters/target/get

data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow set value {target:n,position_x:0,position_y:0,position_z:0,follow_rotation:"",follow_rotation_target:"",follow_rotation2:""}
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.target set from storage energy_manipulation:op target_out[0].uuid
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.anchor set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.anchor
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.position_x set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.offset.x
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.position_y set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.offset.y
data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.position_z set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.offset.z
tag @s add xem.spell.run.shape._movement.follow

# follow rotation
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"fixed"} run return 0
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.target run function energy_manipulation:spell/run/shape/_movement/follow/follow_rotation/target_rotation
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.position run function energy_manipulation:spell/run/shape/_movement/follow/follow_rotation/position_coords