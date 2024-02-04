data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op get_value_in.target
execute unless function energy_manipulation:spell/run/getters/target/get run return run data modify storage energy_manipulation:op get_value_out set value 0

execute store result storage energy_manipulation:op get_value_out int 1 run data get storage energy_manipulation:op target_out 
