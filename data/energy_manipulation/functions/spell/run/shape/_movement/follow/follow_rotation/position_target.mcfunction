# get rotation target
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.position.target
data modify storage energy_manipulation:op target_in.selection set value "single"
function energy_manipulation:spell/run/getters/target/get
execute unless score xem.spell.run.getters.target.found xem.op matches 1 run return 0

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op target_out[0].uuid
data modify storage energy_manipulation:op macro_data.anchor set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.position.anchor
function energy_manipulation:spell/run/shape/_movement/follow/follow_rotation/consolidate_rotation2 with storage energy_manipulation:op macro_data
