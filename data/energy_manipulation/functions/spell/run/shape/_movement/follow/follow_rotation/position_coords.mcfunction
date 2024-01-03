execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.position.target run function energy_manipulation:spell/run/shape/_movement/follow/follow_rotation/position_target
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.position.target run return 1

data modify storage energy_manipulation:op position_in set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation.position
function energy_manipulation:spell/run/getters/position/get

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_input_position_in set from storage energy_manipulation:op position_out
function energy_manipulation:spell/run/getters/macro_input/position
function energy_manipulation:spell/run/shape/_movement/follow/follow_rotation/consolidate_position with storage energy_manipulation:op macro_data
