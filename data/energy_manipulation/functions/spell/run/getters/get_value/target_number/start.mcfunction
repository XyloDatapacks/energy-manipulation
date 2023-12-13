data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op get_value_in.target
function energy_manipulation:spell/run/getters/target/get

execute if score xem.spell.run.getters.target.found xem.op matches 0 run data modify storage energy_manipulation:op get_value_out set value 0
execute if score xem.spell.run.getters.target.found xem.op matches 0 run return 1

execute store result storage energy_manipulation:op get_value_out int 1 run data get storage energy_manipulation:op target_out 
