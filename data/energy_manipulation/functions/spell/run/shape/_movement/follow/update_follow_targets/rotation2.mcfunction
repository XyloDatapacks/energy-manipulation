# get rotation target
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op shape_movement_data.follow_rotation.position.target
data modify storage energy_manipulation:op target_in.selection set value "single"
function energy_manipulation:spell/run/getters/target/get

execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op shape_movement_data.consolidated_follow.follow_rotation_target set from storage energy_manipulation:op target_out[0].uuid
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify entity @s data.energy_manipulation.shape.movement.consolidated_follow.follow_rotation_target set from storage energy_manipulation:op target_out[0].uuid
