# get position target
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op shape_movement_data.target
data modify storage energy_manipulation:op target_in.selection set value "single"
execute if data storage energy_manipulation:op target_in{value:"none"} run data modify storage energy_manipulation:op target_in.distance set value {value:"min"}
function energy_manipulation:spell/run/getters/target/get

execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op shape_movement_data.consolidated_follow.target set from storage energy_manipulation:op target_out[0].uuid
execute unless score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op shape_movement_data.consolidated_follow.target set value "n"
